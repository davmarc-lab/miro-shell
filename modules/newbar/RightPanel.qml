import Quickshell

import QtQuick

import qs.common
import qs.widgets
import qs.types
import qs.modules.rightPanel

Scope {
    Variants {
        model: Quickshell.screens
        HidePanel {
            id: root
            isVertical: true
            anchors {
                right: true
            }
            decorationRight: true
            dirTransition: Transitions.Direction.Left

            animDuration: 350
            triggerSize: Settings.bar.triggerSize / 2
            decorated: false

            implicitHeight: Screen.height - Settings.bar.triggerSize * 4
            implicitWidth: Screen.width * 0.2

            RightPanel {
                anchors.fill: parent
            }
        }
    }
}
