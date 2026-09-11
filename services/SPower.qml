pragma Singleton

import Quickshell
import Quickshell.Services.UPower

import QtQuick

Singleton {
    id: root

    readonly property UPowerDevice battery: UPower.displayDevice
    readonly property string batteryIcon: {
        if (battery.state == UPowerDeviceState.Charging) {
            if (battery.percentage > 0.8)
                return "bat-charg-5";
            if (battery.percentage > 0.6)
                return "bat-charg-4";
            if (battery.percentage > 0.5)
                return "bat-charg-3";
            if (battery.percentage > 0.3)
                return "bat-charg-2";
            if (battery.percentage > 0.2)
                return "bat-charg-1";
            return "bat-charg-0";
        }

        if (battery.percentage > 0.9)
            return "bat-7";
        if (battery.percentage > 0.8)
            return "bat-6";
        if (battery.percentage > 0.65)
            return "bat-5";
        if (battery.percentage > 0.45)
            return "bat-4";
        if (battery.percentage > 0.3)
            return "bat-3";
        if (battery.percentage > 0.2)
            return "bat-2";
        if (battery.percentage > 0.1)
            return "bat-1";
        return "bat-0";
    }

    function isBattery() {
        return root.battery.isLaptopBattery;
    }
}
