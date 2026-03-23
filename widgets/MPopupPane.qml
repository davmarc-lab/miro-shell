import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

import QtQuick.Layouts

import qs
import qs.widgets

MPanelWindow {
    id: root

    WlrLayershell.layer: WlrLayer.Top
    exclusionMode: ExclusionMode.Ignore

    property bool open: true

    aboveWindows: true

    color: "transparent"

    default property alias items: content.children

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    ColumnLayout {
        id: content
        anchors.fill: parent
    }
}
