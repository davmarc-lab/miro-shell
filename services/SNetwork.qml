pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Networking

import QtQuick

Singleton {
    id: root

    property var activeWifi: null

    readonly property bool connected: Networking.connectivity == NetworkConnectivity.Full
    readonly property string current: connected && activeWifi ? activeWifi.name : "WiFi"

    function init() {
        // initial net scan to check connected wifi network
        const nets = this.getAvailableNetworks();
        for (var n of nets) {
            if (n.connected) {
                this.activeWifi = n;
                break;
            }
        }
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
