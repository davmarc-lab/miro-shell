pragma Singleton

import Quickshell
import Quickshell.Services.SystemTray

import QtQuick

Singleton {
    id: root

    readonly property SystemTray items: SystemTray

    function getItems() {
        return items.items;
    }
}
