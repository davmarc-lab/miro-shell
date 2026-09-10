import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

MRectangle {
    id: container

    RowLayout {
        anchors.verticalCenter: parent.verticalCenter
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.leftMargin: Settings.item.margin / 2
        anchors.rightMargin: Settings.item.margin

        spacing: 0

        MFontIcon {
            icon: "\ue045"
            MouseArea {
                anchors.fill: parent
                onClicked: SMediaPlayer.prev()
            }
        }

        MFontIcon {
            icon: "\ue037"
            MouseArea {
                anchors.fill: parent
                onClicked: SMediaPlayer.play()
            }
            visible: !SMediaPlayer.isPlaying
        }

        MFontIcon {
            icon: "\ue034"
            MouseArea {
                anchors.fill: parent
                onClicked: SMediaPlayer.pause()
            }
            visible: SMediaPlayer.isPlaying
        }

        MFontIcon {
            icon: "\ue044"
            MouseArea {
                anchors.fill: parent
                onClicked: SMediaPlayer.next()
            }
        }

        RowLayout {
            id: content

            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignLeft
            Layout.leftMargin: Settings.item.margin / 2

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
