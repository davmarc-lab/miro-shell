pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Networking

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property bool wifi: false
    readonly property bool ethernet: false

    function init() {}

    function connect(wifi) {
        wifi.connect();
    }

    function disconnect(wifi) {
        if (wifi.connected)
            wifi.disconnect();
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
