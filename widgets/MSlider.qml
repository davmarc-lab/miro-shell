import QtQuick
import QtQuick.Controls

import qs.common

Slider {
    id: root

    property alias start: root.from
    property alias end: root.to
    property bool isVertical: false

    visible: !(this.availableWidth == 0 || this.availableHeight == 0)

    orientation: this.isVertical ? Qt.Vertical : Qt.Horizontal
    padding: parent.anchors.margins

    implicitWidth: this.horizontal ? parent.width : thumb.implicitWidth
    implicitHeight: this.vertical ? parent.height : thumb.implicitHeight

    value: this.to / 2

    background: MRectangle {
        id: bar
        anchors.centerIn: parent

        width: root.horizontal ? root.availableWidth : thumb.height / 3
        height: root.vertical ? root.availableHeight : thumb.height / 3

        radius: Settings.item.radius
        color: Theme.colorOutline

        MRectangle {
            width: root.horizontal ? root.visualPosition * parent.width : parent.width
            height: root.vertical ? root.visualPosition * parent.height : parent.height
            radius: parent.radius
            color: Theme.colorPrimary
        }
    }

    handle: MRectangle {
        id: thumb

        implicitWidth: 20
        implicitHeight: implicitWidth

        x: root.horizontal ? bar.x + root.visualPosition * (root.availableWidth - width) : bar.x - bar.width
        y: root.vertical ? bar.y + root.visualPosition * (root.availableHeight - height) : bar.y - bar.height

        radius: height / 2
        color: root.pressed ? Theme.colorSecondary : Theme.colorPrimary

        Behavior on color {
            ColorAnimation {
                duration: 80
            }
        }
    }
}
