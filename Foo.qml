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

    RowLayout {
        width: 300
        height: 100
        anchors.centerIn: parent
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "black"

            MColorEdit {
                anchors.fill: parent
                color: "red"
            }
        }
    }

    // Rectangle {
    //     anchors.fill: parent
    //     color: "black"
    //
    //     MColorEdit {
    //         anchors.fill: parent
    //         color: "red"
    //     }
    // }
}
