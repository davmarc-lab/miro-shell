import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.widgets
import qs.services

Scope {
    Variants {
        model: Quickshell.screens
        PanelWindow {
            WlrLayershell.layer: WlrLayer.Background
            exclusionMode: ExclusionMode.Ignore

            aboveWindows: false

            required property var modelData
            screen: modelData

            color: "transparent"

            implicitWidth: screen.width
            implicitHeight: screen.height

            Image {
                id: name
                anchors.fill: parent
                source: SWallpaper.getCurrent()
            }
        }
    }
}
