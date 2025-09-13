pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls

import qs.common

Button {
    id: root

    property string bgColor: Theme.colorPrimary
    property string bgColorHovered: Theme.colorPrimaryHover
    property string fgColor: Theme.colorOnPrimary
    property string fgColorHovered: Theme.colorOnPrimary

    property string colorClicked: Theme.colorSecondary
    property string outlineColor: Theme.colorOutline
    property int outlineSize: Settings.buttonOutlineSize

    property int borderRadius: Settings.buttonSoftRadius

    property bool isRound: false

    property int sizex: 0
    property int sizey: 0

    anchors {
        leftMargin: Settings.itemMargin
        topMargin: Settings.itemMargin
    }

    background: Rectangle {
        id: back
        implicitHeight: {
            if (root.isRound)
                return this.width;
            return 0;
        }

        color: root.hovered ? (root.pressed ? root.colorClicked : root.bgColorHovered) : root.bgColor
        border.color: root.outlineColor
        border.width: root.outlineSize
        radius: root.isRound ? this.width / 2 : root.borderRadius
    }

    contentItem: MText {
        text: root.text
        font: root.font
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: root.hovered ? root.fgColorHovered : root.fgColor
    }

    font.pointSize: Settings.fontSize
}
