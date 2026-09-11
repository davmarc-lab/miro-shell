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
                return "\ufff3a";
            if (battery.percentage > 0.6)
                return "\ufff3b";
            if (battery.percentage > 0.5)
                return "\ufff3c";
            if (battery.percentage > 0.3)
                return "\ufff3d";
            if (battery.percentage > 0.2)
                return "\ufff3e";
            return "\ufff39";
        }

        if (battery.percentage > 0.9)
            return "\uf304";
        if (battery.percentage > 0.8)
            return "\uf307";
        if (battery.percentage > 0.65)
            return "\uf308";
        if (battery.percentage > 0.45)
            return "\uf309";
        if (battery.percentage > 0.3)
            return "\uf30a";
        if (battery.percentage > 0.2)
            return "\uf30b";
        if (battery.percentage > 0.1)
            return "\uf30c";
        return "\uf30d";
    }

    function isBattery() {
        return root.battery.isLaptopBattery;
    }
}
