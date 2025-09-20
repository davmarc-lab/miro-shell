import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

GridLayout {
    id: root

    anchors.fill: parent

    default property list<PowerMenuButton> buttons

    width: parent.width
    height: parent.height

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

            MIcon {
                id: icon
                anchors.centerIn: parent
                name: `${elem.modelData.icon}.svg`
                implicitSize: parent.width * 0.25
                backer.cache: true
                backer.asynchronous: true
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
