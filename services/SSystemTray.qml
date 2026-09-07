pragma Singleton

import Quickshell
import Quickshell.Services.SystemTray

import QtQuick

Singleton {
    id: root

    readonly property SystemTray items: SystemTray
    readonly property bool itemsCount: SystemTray.items.values.length > 0

    function getItems() {
        return items.items;
    }
}
