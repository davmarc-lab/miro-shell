pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls

import qs.common

Button {
    id: root
    text: "Button"

    property string bgColor: Theme.colorPrimary
    property string bgColorHovered: Theme.colorPrimaryHover
    property string fgColor: Theme.colorOnPrimary
    property string fgColorHovered: Theme.colorOnPrimary

    property string colorClicked: Theme.colorSecondary
    property string outlineColor: Theme.colorOutline
    property int outlineSize: Settings.button.outlineSize

    property int borderRadius: Settings.button.softRadius
    property bool isRound: false

    property string iconPath: ""

    anchors {
        leftMargin: Settings.item.margin
        topMargin: Settings.item.margin
    }

    background: Rectangle {
        id: back
        anchors.fill: parent

        color: root.hovered ? (root.pressed ? root.colorClicked : root.bgColorHovered) : root.bgColor
        border.color: root.outlineColor
        border.width: root.outlineSize
        radius: root.isRound ? this.width / 2 : root.borderRadius
    }

    contentItem: MText {
        id: label
        text: root.text
        font: root.font
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        color: root.hovered ? root.fgColorHovered : root.fgColor
    }

    icon.source: root.iconPath
    icon.cache: true

    font.pixelSize: Settings.font.size
}
