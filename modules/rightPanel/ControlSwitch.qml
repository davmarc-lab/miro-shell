import QtQuick

import qs.common
import qs.widgets

MRectangle {
    id: root
    required property string iconName
    required property string text

    property alias checked: switcher.checked

    signal click

    color: Theme.colorPrimary

    implicitHeight: Settings.rightPanel.iconSize

    Row {
        id: row
        anchors.fill: parent
        anchors.margins: Settings.item.margin * 0.8
        spacing: Settings.item.margin * 0.8

        MFontIcon {
            height: parent.height
            width: height
            icon: root.iconName
            color: Theme.colorOnPrimary
        }

        MScrollableText {
            id: scroll
            width: parent.width - row.spacing - x - (switcher.visible ? switcher.width : 0)
            height: parent.height
            text: root.text
            color: Theme.colorOnPrimary
        }

        MSwitch {
            id: switcher
            bgDisabled: Theme.colorOnPrimary
            bgEnabled: Theme.colorOutline
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
