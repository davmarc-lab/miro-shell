import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.common
import qs.types
import qs.widgets

MPanelWindow {
    id: root
    screen: modelData
    required property var modelData

    WlrLayershell.layer: WlrLayer.Top
    exclusionMode: ExclusionMode.Ignore
    aboveWindows: true
    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None
    color: "transparent"

    // mouse hovering the content/trigger
    property bool hovering: decorationHover.hovered || contentMouse.hovered || timer.running
    readonly property bool collapsed: root.isVertical ? Math.abs(content.x) == root.width : Math.abs(content.y) == root.height
    property alias outTime: timer.interval

    property bool isVertical: false

    // animation porperties
    property alias animDuration: xanim.duration
    property alias animType: xanim.easing.type

    // decoration porperties
    property bool decorated: true
    required property int dirTransition
    property bool decorationTop: false
    property bool decorationBottom: false
    property bool decorationRight: false
    property bool decorationLeft: false
    property int triggerSize: Settings.bar.triggerSize
    property string triggerColor: Theme.colorPrimary
    property alias topLeftRadius: decoration.topLeftRadius
    property alias topRightRadius: decoration.topRightRadius
    property alias bottomLeftRadius: decoration.bottomLeftRadius
    property alias bottomRightRadius: decoration.bottomRightRadius

    // content items
    default property alias items: content.children

    mask: Region {
        item: root.collapsed ? decoration : content
    }

    Timer {
        id: timer
        interval: 1000
    }

    // always living item for activation
    MRectangle {
        id: decoration

        width: root.isVertical ? root.triggerSize : parent.width
        height: !root.isVertical ? root.triggerSize : parent.height
        anchors {
            top: root.decorationTop ? parent.top : undefined
            bottom: root.decorationBottom ? parent.bottom : undefined
            right: root.decorationRight ? parent.right : undefined
            left: root.decorationLeft ? parent.left : undefined
        }

        color: root.decorated ? root.triggerColor : "transparent"

        HoverHandler {
            id: decorationHover
        }
    }

    Item {
        id: content
        width: root.width
        height: root.height

        x: root.hovering ? 0 : root.isVertical ? evalDir(root.width) : 0
        y: root.hovering ? 0 : root.isVertical ? 0 : evalDir(root.height)

        function evalDir(val: int): int {
            return val * (root.dirTransition === Transitions.Direction.Top || root.dirTransition === Transitions.Direction.Left ? 1 : -1);
        }

        Behavior on x {
            NumberAnimation {
                id: xanim
                duration: 250
                easing.type: Easing.InOutCubic
            }
        }

        Behavior on y {
            NumberAnimation {
                id: yanim
                duration: root.animDuration
                easing.type: root.animType
            }
        }

        visible: !root.collapsed

        HoverHandler {
            id: contentMouse
            onHoveredChanged: timer.running = !hovered
        }
    }
}
