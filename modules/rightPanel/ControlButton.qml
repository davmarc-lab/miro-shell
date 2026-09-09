import QtQuick

import qs.common
import qs.widgets

MRectangle {
    id: root
    required property string iconName
    required property string text

    property bool action: true

    signal click

    color: Theme.colorPrimary

    implicitHeight: Settings.rightPanel.iconSize

    Row {
        id: row
        anchors.fill: parent
        anchors.margins: Settings.item.margin * 0.8
        spacing: Settings.item.margin * 0.8

        MThemeIcon {
            height: parent.height
            width: height
            name: root.iconName
        }

        MScrollableText {
            id: scroll
            width: parent.width - row.spacing - x - (actionRect.visible ? actionRect.width : 0)
            height: parent.height
            text: root.text
            color: Theme.colorOnPrimary
        }

        MRectangle {
            id: actionRect
            visible: root.action
            height: parent.height
            width: height
            radius: width / 2

            MThemeIcon {
                anchors.fill: parent
                anchors.margins: Settings.item.margin / 2
                name: "right-arrow.svg"
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        hoverEnabled: true
        onHoveredChanged: {
            if (this.containsMouse)
                scroll.startScroll();
            else
                scroll.resetScroll();
        }

        onClicked: root.click()
    }
}
