import Quickshell
import Quickshell.Wayland

import QtQuick

import qs.common
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
    property alias outTime: timer.interval

    property bool isVertical: false

    // animation porperties
    property alias animDuration: anim.duration
    property alias animType: anim.easing.type

    // decoration porperties
    property bool decorated: true
    property bool decorationTop: false
    property bool decorationBottom: false
    property bool decorationRight: false
    property bool decorationLeft: false
    property alias triggerHeight: decoration.height
    property string triggerColor: Theme.colorPrimary
    property alias topLeftRadius: decoration.topLeftRadius
    property alias topRightRadius: decoration.topRightRadius
    property alias bottomLeftRadius: decoration.bottomLeftRadius
    property alias bottomRightRadius: decoration.bottomRightRadius

    // content items
    default property alias items: content.children

    Timer {
        id: timer
        interval: 1000
    }

    // always living item for activation
    MRectangle {
        id: decoration
        visible: root.decorated

        width: root.isVertical ? Settings.bar.triggerSize : parent.width
        height: !root.isVertical ? Settings.bar.triggerSize : parent.height
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

        x: root.hovering && !root.isVertical ? 0 : -root.width
        y: root.hovering && !root.isVertical ? 0 : -root.height

        clip: true

        visible: root.isVertical ? y > -root.height : x > -root.width

        Behavior on y {
            NumberAnimation {
                id: anim
                duration: 250
                easing.type: Easing.InOutCubic
            }
        }

        HoverHandler {
            id: contentMouse
            onHoveredChanged: {
                timer.running = !hovered;
                console.log("HE")
            }
        }
    }
}
