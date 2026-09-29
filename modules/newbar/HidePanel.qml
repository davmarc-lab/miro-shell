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
    color: "transparent"

    // --- hiding logic ---
    // normal/force panel visibility
    property bool open: false
    // mouse enters the region
    property bool awaitingEnter: false
    readonly property bool collapsed: root.isVertical ? Math.abs(content.x) == root.width : Math.abs(content.y) == root.height

    // --- animation porperties ---
    property alias animDuration: xanim.duration
    property alias animType: xanim.easing.type

    // --- decoration porperties ---
    property bool decorated: true
    property bool isVertical: false
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

    function peek() {
        hideTimer.stop();
        root.open = true;
        root.awaitingEnter = !contentMouse.hovered;
    }

    function hide() {
        triggerTimer.stop();
        hideTimer.stop();
        root.awaitingEnter = false;
        root.open = false;
    }

    function toggle() {
        root.open ? root.hide() : root.peek();
    }

    mask: Region {
        item: root.collapsed ? decoration : content
    }

    Timer {
        id: hideTimer
        interval: 350
        onTriggered: root.open = false
    }

    Timer {
        id: triggerTimer
        interval: 200
        onTriggered: root.open = true
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
            onHoveredChanged: {
                if (hovered) {
                    triggerTimer.restart();
                } else {
                    triggerTimer.stop();
                    // opened by `peek()` and never entered yet.
                    if (root.open && !root.awaitingEnter && !contentMouse.hovered)
                        hideTimer.restart();
                }
            }
        }
    }

    Item {
        id: content
        width: root.width
        height: root.height

        x: root.open ? 0 : root.isVertical ? evalDir(root.width) : 0
        y: root.open ? 0 : root.isVertical ? 0 : evalDir(root.height)

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
            onHoveredChanged: {
                if (hovered) {
                    root.awaitingEnter = false;
                    hideTimer.stop();
                } else {
                    hideTimer.restart();
                }
            }
        }
    }
}
