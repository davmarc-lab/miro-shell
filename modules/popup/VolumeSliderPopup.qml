import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import QtQml

import qs
import qs.common
import qs.widgets

MPopupPane {
    id: root

    anchors {
        top: true
        bottom: false
        right: true
        left: false
    }

    margins {
        top: Settings.bar.size
        // fixed now, maybe take the VolumeInfo x or y position and calc the offset
        right: 90
    }

    implicitWidth: 220
    implicitHeight: 40

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    mask: Region {
        item: base
    }

    MRectangle {
        id: base
        Layout.fillHeight: true
        Layout.fillWidth: true

        MVolumeSlider {
            anchors.margins: Settings.item.margin
        }

        HoverHandler {
            id: hover
        }

        Timer {
            id: timer
            interval: 1000
            running: !hover.hovered
            onTriggered: Global.enableVolumeSliderPopup = false
        }
    }
}
