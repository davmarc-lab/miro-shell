import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.common
import qs.widgets
import qs.modules.bar

Scope {
    Variants {
        model: Quickshell.screens

        MPanelWindow {
            id: root
            screen: modelData
            required property var modelData

            WlrLayershell.layer: WlrLayer.Top
            exclusionMode: ExclusionMode.Ignore
            aboveWindows: true
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
            color: "transparent"

            property bool hovering: mouse.hovered || content.hovered

            implicitHeight: root.hovering ? Settings.bar.height : 10
            implicitWidth: workspaces.implicitWidth + (Settings.item.margin * 2)

            Behavior on implicitHeight {
                NumberAnimation {
                    id: mainAnim
                    duration: 150
                    easing.type: Easing.Linear
                }
            }

            anchors {
                top: true
                bottom: false
                left: true
                right: false
            }

            // always living item for activation
            Item {
                anchors.fill: parent
                HoverHandler {
                    id: mouse
                }
            }

            MRectangle {
                height: root.height
                width: root.width
                topLeftRadius: 0
                topRightRadius: topLeftRadius

                HoverHandler {
                    id: content
                }

                x: parent.x
                y: root.hovering ? parent.y : -Settings.bar.height
                Behavior on y {
                    NumberAnimation {
                        duration: mainAnim.duration
                        easing.type: Easing.Linear
                    }
                }

                // Background turns visible on hover, completely clear when idle
                color: Theme.colorSurfaceVariant

                Workspaces {
                    id: workspaces
                    anchors.centerIn: parent
                    anchors.top: parent.top
                }
            }
        }
    }
}
