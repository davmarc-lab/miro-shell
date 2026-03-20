import QtQuick
import QtQuick.Controls

import qs.common

Slider {
    id: root

    property alias start: root.from
    property alias end: root.to
    property bool isVertical: false

    from: 0
    to: 100
    value: root.to / 2

    property int bgWidth: 200
    property int bgHeight: 4

    property string bgRightColor: Theme.colorPrimary
    property string bgLeftColor: Theme.colorOutline

    property int handleSize: 20
    property int handleRadius: 13

    orientation: isVertical ? Qt.Vertical : Qt.Horizontal

    property int trackHeight: 4
    property int trackRadius: 13
    property color trackColor: Theme.colorOutline
    property color trackFillColor: Theme.colorPrimary

    background: Rectangle {
        x: root.leftPadding
        y: root.topPadding + root.availableHeight / 2 - height / 2
        width: root.availableWidth
        height: root.trackHeight
        radius: root.trackRadius
        color: root.trackColor

        Rectangle {
            width: root.visualPosition * parent.width
            height: parent.height
            radius: root.trackRadius
            color: root.trackFillColor
        }
    }

    handle: MRectangle {
        x: root.leftPadding + root.visualPosition * (root.availableWidth - width)
        y: root.topPadding + root.availableHeight / 2 - height / 2
        implicitWidth: root.handleSize
        implicitHeight: root.handleSize
        radius: root.handleRadius
        color: Theme.colorPrimary
        border.color: Theme.colorOutline
    }
}
