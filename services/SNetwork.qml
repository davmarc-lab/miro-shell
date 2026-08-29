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

    function init() {
        // current networking status
        // console.log(Networking.connectivity);

        const devs = Networking.devices.values;
        for (const d of devs) {
            console.log(d);
            console.log(d.autoconnect);
            console.log(d.address);
            console.log(d.name);
            if (d.type == DeviceType.Wifi) {
                // d.scannerEnabled = false;
                console.log(d.scannerEnabled);
            }
            console.log(d.type);    // 0 = None, 1 = Wifi, 2 = Wired (DeviceType)
            console.log(d.state);   // (ConnectionState)
            // if type = 1 then only ObjectModel<WifiNetwork>
            console.log(d.networks);    // (ObjectModel<Network>) available networks for this device

            // fn disconnect()
        }
    }

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
