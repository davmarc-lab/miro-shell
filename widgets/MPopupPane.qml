import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

/* This component just creates an invisible window with a mask region defined
 * by the first element in items.
 *
 * When using this component always include a MRectangle representing the popup container.
 */
MPanelWindow {
    id: root

    WlrLayershell.layer: WlrLayer.Top
    exclusionMode: ExclusionMode.Ignore

    aboveWindows: true

    color: "transparent"

    default property alias items: panel.children

    required property double sizex
    required property double sizey

    property string panelColor: Theme.colorSurface
    property int align: Qt.AlignCenter

    property bool mouseDown: rootArea.pressed
    property bool hovered: hover.hovered
    property bool open: false

    onMouseDownChanged: {
        this.open = this.mouseDown && this.hovered;
    }

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    ColumnLayout {
        id: content
        anchors.fill: parent

        // content item
        MRectangle {
            id: panel
            Layout.preferredWidth: root.sizex
            Layout.preferredHeight: root.sizey
            Layout.alignment: root.align

            HoverHandler {
                id: hover
            }
        }
    }

    MouseArea {
        id: rootArea
        anchors.fill: parent
        propagateComposedEvents: true

    }
}
