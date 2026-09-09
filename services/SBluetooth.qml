pragma Singleton

import Quickshell
import Quickshell.Bluetooth

Singleton {
    id: root

    function getDevices() {
        return Bluetooth.devices;
    }

    function getDefaultAdapter() {
        return Bluetooth.defaultAdapter;
    }

    function connect(device) {
        if (!device.paired)
            device.pair();
        device.connect();
    }

    function disconnect(device) {
        if (device.connected)
            device.disconnect();
    }

    function forget(device) {
        if (device.paired)
            device.forget();
    }
}
