import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.common
import qs.widgets
import qs.services
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
            implicitWidth: foo.width + (Settings.item.margin * 2)

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
                left: false
                right: false
            }

            // always living item for activation
            Item {
                anchors.fill: parent
                HoverHandler {
                    id: mouse
                }
                // decoration
                MRectangle {
                    topLeftRadius: 0
                    topRightRadius: topLeftRadius
                    width: parent.width
                    height: parent.height / 2
                    color: Theme.colorPrimary
                }
            }

            MRectangle {
                id: base
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

                property bool showDate: false

                Item {
                    id: foo

                    width: clock.width + media.width
                    height: parent.height

                    anchors.centerIn: parent

                    MText {
                        id: clock
                        anchors.centerIn: parent
                        text: base.showDate ? STime.date : STime.time
                    }

                    Item {
                        id: media
                        anchors {
                            top: parent.top
                            bottom: parent.bottom
                            right: clock.left
                        }
                        width: 600
                        MediaPlayer {
                            anchors.centerIn: parent
                        }
                    }
                }
                MouseArea {
                    onClicked: base.showDate = !base.showDate
                }
            }
        }
    }
}
