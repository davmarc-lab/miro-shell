import Quickshell
import Quickshell.Io

import QtQuick

import qs.common
import qs.widgets
import qs.types
import qs.modules.utility

Scope {
    Variants {
        model: Quickshell.screens
        HidePanel {
            id: root
            isVertical: true
            anchors {
                left: true
            }
            decorationLeft: true
            dirTransition: Transitions.Direction.Right

            animDuration: 350
            triggerSize: Settings.bar.triggerSize / 2
            decorated: false

            implicitWidth: Settings.utilityPanel.width
            implicitHeight: Settings.utilityPanel.height

            Utility {
                anchors.fill: parent

                IpcHandler {
                    target: "utility"
                    function toggle(): void {
                        root.toggle();
                    }
                }
            }
        }
    }
}
