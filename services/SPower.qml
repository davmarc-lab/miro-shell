pragma Singleton

import Quickshell
import Quickshell.Services.UPower

import qs

Singleton {
    id: root

    readonly property UPowerDevice device: UPower.displayDevice
}
