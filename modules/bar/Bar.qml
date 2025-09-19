import Quickshell

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets
import qs.services

Scope {
    Variants {
        model: Quickshell.screens

        MPanelWindow {
            id: root

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitWidth: screen.width
            implicitHeight: Settings.barHeight

            Item {
                id: leftSection

                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.right: middleSection.left

                RowLayout {
                    id: bar
                    anchors.fill: parent

                    Logo {}

                    Workspaces {}

                    MediaPlayer {}

                    MFillLayout {
                        dy: false
                    }
                }
            }

            RowLayout {
                id: middleSection

                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter

                MButton {
                    text: STime.time
                    onClicked: {
                        Global.enableDock = !Global.enableDock;
                    }
                }
            }

            Item {
                id: rightSection

                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: middleSection.right
                anchors.right: parent.right

                RowLayout {
                    id: rightPanel
                    anchors.fill: parent

                    Layout.alignment: Qt.AlignVCenter | Qt.AlignRight
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MFillLayout {}

                    MRectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "red"
                    }

                    MRectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: "green"
                    }

                    MIconButton {
                        Layout.fillHeight: true
                        Layout.preferredWidth: this.height
                        iconName: Global.enableRightPanel ? "down-arrow.svg" : "right-arrow.svg"

                        color: Theme.colorSurfaceVariant
                        onIconClick: {
                            Global.enableRightPanel = !Global.enableRightPanel;
                        }

                        // MIconClick {
                        //     anchors.fill: parent
                        //     anchors.margins: Settings.itemMargin
                        // }
                    }
                }

                MFillLayout {
                    dy: false
                }
            }
        }
    }
}
