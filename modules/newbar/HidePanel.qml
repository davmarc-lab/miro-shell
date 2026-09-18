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
    property bool hovering: decorationHover.hovered || contentMouse.hovered|| timer.running
    property alias outTime: timer.interval

    // animation porperties
    property alias animDuration: anim.duration
    property alias animType: anim.easing.type

    // decoration porperties
    property bool decorated: true
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

        width: parent.width
        height: Settings.bar.triggerSize
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
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

        y: root.hovering ? 0 : -root.height
        clip: true

        visible: y > -root.height

        Behavior on y {
            NumberAnimation {
                id: anim
                duration: 250
                easing.type: Easing.InOutCubic
            }
        }

        HoverHandler {
            id: contentMouse
            onHoveredChanged: timer.running = !hovered
        }
    }
}
