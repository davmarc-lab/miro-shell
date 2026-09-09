pragma Singleton

import Quickshell
import Quickshell.Services.UPower

import QtQuick

import qs

Singleton {
    id: root

    readonly property UPowerDevice battery: UPower.displayDevice

    function isBattery() {
        return root.battery.isLaptopBattery;
    }
}
