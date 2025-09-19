import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.widgets

Scope {
    Variants {
        model: Quickshell.screens
        MPopup {
            WlrLayershell.layer: WlrLayer.Background
            exclusionMode: ExclusionMode.Ignore

            aboveWindows: false

            required property var modelData
            screen: modelData

            exclusionMode: ExclusionMode.Ignore

            WlrLayershell.layer: WlrLayer.Background
            aboveWindows: false
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
