pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

ApplicationWindow {
    id: root

    topPadding: 0

    visible: Global.firstRun

    color: Theme.colorSurface

    onClosing: {
        Global.firstRun = false;
    }

    property int currentSection: 0

    MRectangle {
        anchors.fill: parent
        implicitWidth: parent.width * 0.6

        radius: Settings.itemRadius

        color: root.color

        RowLayout {
            anchors.fill: parent
            anchors.topMargin: Settings.panelMargin
            anchors.bottomMargin: anchors.topMargin
            anchors.leftMargin: Settings.panelMargin
            anchors.rightMargin: anchors.leftMargin

            spacing: Settings.panelMargin

            Rectangle {
                id: indexPanel
                Layout.fillHeight: true
                Layout.minimumWidth: 200
                implicitWidth: parent.width * 0.3

                color: Theme.colorSurfaceVariant

                radius: Settings.itemRadius

                ColumnLayout {
                    anchors {
                        top: parent.top
                        // bottom: parent.bottom
                        left: parent.left
                        right: parent.right
                    }

                    anchors.topMargin: Settings.panelMargin
                    anchors.bottomMargin: anchors.topMargin
                    anchors.leftMargin: Settings.panelMargin
                    anchors.rightMargin: anchors.leftMargin
                }
            }

            Rectangle {
                id: contentPanel
                Layout.fillHeight: true
                Layout.fillWidth: true

                color: Theme.colorSurfaceVariant

                radius: Settings.itemRadius
            }
        }
    }
}
