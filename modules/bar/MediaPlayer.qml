import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

MRectangle {
    id: container

    readonly property double iconScale: 0.7

    RowLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.margins: 2
        anchors.leftMargin: Settings.item.margin
        anchors.rightMargin: Settings.item.margin

        spacing: Settings.item.margin

        MThemeIconClick {
            implicitSize: parent.height * container.iconScale
            name: "prev.svg"

            onIconClick: {
                SMediaPlayer.prev();
            }
        }

        MThemeIconClick {
            implicitSize: parent.height * container.iconScale
            name: "play.svg"

            onIconClick: {
                SMediaPlayer.play();
            }
            visible: !SMediaPlayer.isPlaying
        }

        MThemeIconClick {
            implicitSize: parent.height * container.iconScale
            name: "pause.svg"

            onIconClick: {
                SMediaPlayer.pause();
            }
            visible: SMediaPlayer.isPlaying
        }

        MThemeIconClick {
            implicitSize: parent.height * container.iconScale
            name: "next.svg"

            onIconClick: {
                SMediaPlayer.next();
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

        // MThemeIcon {
        //     Layout.fillHeight: true
        //     Layout.preferredWidth: 20
        //     name: "prev.svg"
        // }

        //
    }
}
