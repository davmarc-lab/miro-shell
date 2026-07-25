import Quickshell
import Quickshell.Hyprland
import Quickshell.Wayland

import QtQuick.Layouts

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

    property bool open: true

    aboveWindows: true

    color: "transparent"

    default property alias items: content.children

    anchors {
        top: true
        left: true
        right: true
        bottom: true
    }

    mask: Region {
        item: content.children[0] ?? null
    }

    ColumnLayout {
        id: content
        anchors.fill: parent
    }

    HyprlandFocusGrab {
        active: root.open
        windows: [root]
        onCleared: {
            root.open = false;
        }
    }
}
