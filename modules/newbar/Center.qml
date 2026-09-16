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
        HidePanel {
            id: root

            anchors {
                top: true
                bottom: false
                left: false
                right: false
            }

            implicitHeight: root.hovering ? Settings.bar.height : 10
            implicitWidth: foo.width + (Settings.item.margin * 2)

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
                        duration: 150
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
                    anchors.fill: parent
                    onClicked: base.showDate = !base.showDate
                }
            }
        }
    }
}
