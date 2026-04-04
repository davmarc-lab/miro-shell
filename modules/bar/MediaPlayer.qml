import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

MRectangle {
    id: container
    Layout.minimumWidth: 350
    Layout.fillHeight: true
    Layout.margins: 4

    RowLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right

        spacing: Settings.itemMargin
        anchors.margins: Settings.itemMargin

        RowLayout {
            MThemeIconClick {
                Layout.preferredWidth: 20
                Layout.preferredHeight: 20

                name: "prev.svg"

                onIconClick: {
                    SMediaPlayer.prev();
                }
            }

            MThemeIconClick {
                Layout.preferredWidth: 20
                Layout.preferredHeight: 20

                name: "play.svg"

                onIconClick: {
                    SMediaPlayer.play();
                }
                visible: !SMediaPlayer.isPlaying
            }

            MThemeIconClick {
                Layout.preferredWidth: 20
                Layout.preferredHeight: 20

                name: "pause.svg"

                onIconClick: {
                    SMediaPlayer.pause();
                }
                visible: SMediaPlayer.isPlaying
            }

            MThemeIconClick {
                Layout.preferredWidth: 20
                Layout.preferredHeight: 20

                name: "next.svg"

                onIconClick: {
                    SMediaPlayer.next();
                }
            }
        }

        RowLayout {
            id: content

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft

            MText {
                Layout.fillWidth: true
                Layout.maximumWidth: container.width
                Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter

                text: SMediaPlayer.barToString()
                clip: true
            }
        }
    }
}
