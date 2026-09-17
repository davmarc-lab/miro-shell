import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

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

            implicitHeight: root.hovering ? Settings.bar.height * 2 : 10
            implicitWidth: Screen.width * 0.2 + Settings.item.margin * 2
            decorated: false

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
                    visible: false
                    anchors.fill: parent
                    MText {
                        id: clock
                        Layout.alignment: Qt.AlignHCenter
                        text: base.showDate ? STime.date : STime.time
                    }

                    MediaPlayer {
                        visible: SMediaPlayer.currentPlayer != null
                        Layout.alignment: Qt.AlignCenter
                        Layout.fillWidth: true
                        Layout.fillHeight: true
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
