import QtQuick
import QtQuick.Layouts

import Quickshell

import qs.widgets
import qs.services
import qs.common

MPanelWindow {
    id: root
    visible: true

    anchors {
        bottom: true
        right: true
        left: true
    }

    margins {
        bottom: 10
    }

    color: Theme.colorSurfaceVariant

    // ColumnLayout {
    //     id: l
    //     anchors.centerIn: parent
    //     MSwitch {
    //         // text: "Layout"
    //     }
    // }

    // RowLayout {
    //     anchors.fill: parent
    //
    //     ColumnLayout {
    //         MSlider {
    //             // padding: 10
    //             isVertical: false
    //         }
    //     }
    // }

    Rectangle {
        width: parent.height
        height: parent.height
        anchors.centerIn: parent
        color: "white"

        MSlider {
            anchors.centerIn: parent
            isVertical: false
        }
    }
}
