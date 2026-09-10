pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Networking

import QtQuick

Singleton {
    id: root

    property bool enableWifi: Networking.wifiEnabled
    property var activeWifi: null

    readonly property bool connected: Networking.connectivity == NetworkConnectivity.Full
    readonly property string current: connected && activeWifi ? activeWifi.name : "Network" ?? ""

    function scanActive() {
        if (!this.connected)
            return;

        const nets = this.getAvailableNetworks();
        for (var n of nets) {
            if (n.connected) {
                this.activeWifi = n;
                return;
            }
        }
    }

    function init() {
        // initial net scan to check connected wifi network
        this.scanActive();
    }

    // using extra variable to avoid switch flickering while enabling wifi
    function toggleWifi() {
        Networking.wifiEnabled = !Networking.wifiEnabled;
    }

    function connect(wifi) {
        wifi.connect();
        root.activeWifi = wifi;
    }

    function disconnect(wifi) {
        if (wifi.connected) {
            wifi.disconnect();
            root.activeWifi = null;
        }
    }

    function forget(wifi) {
        if (wifi.known) {
            this.disconnect(wifi);
            wifi.forget();
        }
    }

    function getDevices() {
        return Networking.devices.values;
    }

    function getNetworks() {
        return Networking.devices.values.map(d => d.networks.values).reduce((acc, cur) => acc.concat(cur), []);
    }

    function getAvailableNetworks() {
        return Networking.devices.values.map(d => {
            if (d.type === DeviceType.Wifi)
                d.scannerEnabled = true;
            return d.networks.values;
        }).reduce((acc, cur) => acc.concat(cur), []);
    }

    function getSignalIcon(strenght: real): string {
        if (strenght > 0.75)
            return "\ue1d8";
        if (strenght > 0.5)
            return "\uebe1";
        if (strenght > 0.25)
            return "\uebd6";
        return "\uebe4";
    }

    IpcHandler {
        target: "network"

        function dumpDevices(): void {
            console.log(Networking.devices.values);
        }

        function getDevices() {
            return root.getDevices();
        }

        function getNetworks() {
            root.getNetworks();
        }
    }
}
