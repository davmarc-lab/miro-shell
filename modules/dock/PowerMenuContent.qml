import QtQuick
import QtQuick.Layouts

import qs.common

GridLayout {
    id: root

    anchors.fill: parent

    default property list<PowerMenuButton> buttons

    width: parent.width * 0.75
    height: parent.height * 0.75

    columns: 3
    columnSpacing: 0
    rowSpacing: 0

    Repeater {
        model: root.buttons

        delegate: Rectangle {
            id: elem
            required property PowerMenuButton modelData

            Layout.fillWidth: true
            Layout.fillHeight: true

            color: ma.containsMouse ? Theme.colorOutline : Theme.colorShadow
            border.color: "black"
            border.width: ma.containsMouse ? 0 : 1

            MouseArea {
                id: ma
                anchors.fill: parent
                hoverEnabled: true
                onClicked: elem.modelData.exec()
            }

            Image {
                id: icon
                anchors.centerIn: parent
                source: `${Settings.iconsPath}powermenu/${elem.modelData.icon}.png`
                width: parent.width * 0.25
                height: parent.width * 0.25
            }

            Text {
                anchors {
                    top: icon.bottom
                    topMargin: 20
                    horizontalCenter: parent.horizontalCenter
                }

                text: elem.modelData.text
                font.pointSize: 20
                color: Theme.colorOnSurface
            }
        }
    }
}

