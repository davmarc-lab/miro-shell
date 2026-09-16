import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.common
import qs.widgets
import qs.modules.bar

Scope {
    Variants {
        model: Quickshell.screens
        HidePanel {
            id: root
            anchors {
                top: true
                bottom: false
                left: true
                right: false
            }

            implicitHeight: root.hovering ? Settings.bar.height : 10
            implicitWidth: workspaces.implicitWidth + (Settings.item.margin * 2)

            MRectangle {
                id: base
                height: root.height
                width: root.width
                topLeftRadius: 0
                topRightRadius: topLeftRadius

                x: parent.x
                y: root.hovering ? parent.y : -Settings.bar.height
                Behavior on y {
                    NumberAnimation {
                        id: mainAnim
                        duration: 150
                        easing.type: Easing.Linear
                    }
                }

                Workspaces {
                    id: workspaces
                    anchors.centerIn: parent
                }
            }
        }
    }
}
