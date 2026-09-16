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

    property bool hovering: mouse.hovered || timer.running
    property bool decorated: true
    property alias outTime: timer.interval

    property alias topLeftRadius: decoration.topLeftRadius
    property alias topRightRadius: decoration.topRightRadius
    property alias bottomLeftRadius: decoration.bottomLeftRadius
    property alias bottomRightRadius: decoration.bottomRightRadius

    default property alias items: content.children

    Timer {
        id: timer
        interval: 1000
        running: false
    }

    // always living item for activation
    Item {
        anchors.fill: parent

        // decoration
        MRectangle {
            id: decoration
            visible: root.decorated && !root.hovering
            topLeftRadius: 0
            topRightRadius: topLeftRadius
            bottomLeftRadius: 0
            width: parent.width
            height: parent.height / 2
            color: Theme.colorPrimary

            Behavior on visible {
                NumberAnimation {
                    duration: 150
                    easing.type: Easing.Linear
                }
            }
        }
    }

    Item {
        id: content
        anchors.fill: parent

        Behavior on implicitHeight {
            NumberAnimation {
                id: mainAnim
                duration: 150
                easing.type: Easing.Linear
            }
        }
    }

    HoverHandler {
        id: mouse

        onHoveredChanged: timer.running = !hovered
    }
}
