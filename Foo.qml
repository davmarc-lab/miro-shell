import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

PanelWindow {
    anchors {
        top: true
        left: true
        bottom: true
    }
    exclusiveZone: 0

    implicitWidth: 150
    color: Theme.colorSurface

    ColumnLayout {
        anchors.fill: parent
        spacing: 5

        MRectangle {
            id: foo
            Layout.alignment: Qt.AlignHCenter

            radius: Settings.buttonSoftRadius
        }

        MButton {
            text: STime.day
        }

        MRButton {
            text: "Hello"
        }

        MFillLayout {}
    }
}
