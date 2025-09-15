import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs.services
import qs.widgets

RowLayout {
    Layout.fillWidth: true
    Layout.fillHeight: true

    MRectangle {
        id: container
        Layout.margins: 4

        color: "yellow"

        RowLayout {
            anchors.fill: parent
            spacing: 5
            anchors.leftMargin: 3
            anchors.rightMargin: anchors.leftMargin

            RowLayout {
                // Layout.fillWidth: true
                Layout.fillHeight: true

                MIconClick {
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20

                    name: "prev.svg"

                    onIconClick: {
                        SMediaPlayer.prev();
                    }
                }

                MIconClick {
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20

                    name: "play.svg"

                    onIconClick: {
                        SMediaPlayer.play();
                    }
                    visible: !SMediaPlayer.isPlaying
                }

                MIconClick {
                    Layout.preferredWidth: 20
                    Layout.preferredHeight: 20

                    name: "pause.svg"

                    onIconClick: {
                        SMediaPlayer.pause();
                    }
                    visible: SMediaPlayer.isPlaying
                }

                MIconClick {
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
                    color: "black"
                    clip: true
                }
            }
        }
    }
}
