import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.types
import qs.widgets
import qs.modules.bar

Scope {
    Variants {
        model: Quickshell.screens
        HidePanel {
            id: root

            anchors {
                top: true
            }
            decorationTop: true
            dirTransition: Transitions.Direction.Bottom

            // height must not be affected when the media is available (binded to item visibility)
            implicitHeight: player.visible ? Settings.bar.height * 2 : Settings.bar.height
            // width needs to react when the media becomes available
            implicitWidth: isMediaAvailable() ? Screen.width * 0.2 + Settings.item.margin * 2 : clock.contentWidth + Settings.item.margin * 2

            topLeftRadius: 0
            topRightRadius: 0

            function isMediaAvailable() {
                return SMediaPlayer.currentPlayer != null;
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

                property bool showDate: false

                ColumnLayout {
                    anchors.fill: parent
                    MText {
                        id: clock
                        Layout.alignment: Qt.AlignHCenter
                        text: base.showDate ? STime.date : STime.time

                        MouseArea {
                            anchors.fill: parent
                            onClicked: base.showDate = !base.showDate
                        }
                    }

                    MediaPlayer {
                        id: player
                        visible: root.isMediaAvailable() && !root.collapsed
                        Layout.alignment: Qt.AlignCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}
