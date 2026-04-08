import Quickshell
import Quickshell.Wayland

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
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            required property var modelData
            screen: modelData

            anchors {
                top: Settings.bar.align.isTop || Settings.bar.align.isVertical
                left: Settings.bar.align.isLeft || Settings.bar.align.isHorizontal
                right: Settings.bar.align.isRight || Settings.bar.align.isHorizontal
                bottom: Settings.bar.align.isBottom || Settings.bar.align.isVertical
            }

            implicitWidth: Settings.bar.align.isHorizontal ? screen.width : Settings.bar.barHeight
            implicitHeight: Settings.bar.align.isVertical ? screen.height : Settings.bar.barWidth

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

                Clock {}
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

                    MWrapRectangle {
                        Layout.fillHeight: true

                        RowLayout {
                            anchors.fill: parent
                            anchors.leftMargin: 6

                            KeyboardInfo {}

                            VolumeInfo {}

                            BatteryInfo {}

                            MFillLayout {}
                        }
                    }

                    MRectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.maximumWidth: 150

                        SystemTray {
                            anchors.fill: parent
                        }
                    }

                    MThemeIconButton {
                        Layout.fillHeight: true
                        Layout.preferredWidth: this.height
                        iconName: Global.enableRightPanel ? "down-arrow.svg" : "right-arrow.svg"

                        color: Theme.colorSurfaceVariant
                        onIconClick: {
                            Global.enableRightPanel = true;
                        }
                    }
                }

                MFillLayout {
                    dy: false
                }
            }
        }
    }
}
