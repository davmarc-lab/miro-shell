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
            console.log(d.autoconnect);
            console.log(d.address);
            console.log(d.name);
            console.log(d.type);    // 0 = None, 1 = Wifi, 2 = Wired (DeviceType)
            console.log(d.state);   // (ConnectionState)
            // if type = 1 then only ObjectModel<WifiNetwork>
            console.log(d.networks);    // (ObjectModel<Network>) available networks for this device

            // fn disconnect()
        }
    }
}
