pragma Singleton

import Quickshell
import Quickshell.Services.UPower

import QtQuick

import qs

Singleton {
    id: root

    readonly property UPowerDevice device: UPower.displayDevice

    function init() {
        console.log("AA");
    }
}
