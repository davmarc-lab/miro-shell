import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs
import qs.services
import qs.common
import qs.widgets

Scope {
    Variants {
        model: Quickshell.screens

        MPanelWindow {
            id: root
            WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

            required property var modelData
            screen: modelData

            property string opacity: "aa"

            color: "#" + opacity + Theme.colorSurface.substr(1)

            anchors {
                top: Settings.bar.align.isTop || Settings.bar.align.isVertical
                left: Settings.bar.align.isLeft || Settings.bar.align.isHorizontal
                right: Settings.bar.align.isRight || Settings.bar.align.isHorizontal
                bottom: Settings.bar.align.isBottom || Settings.bar.align.isVertical
            }

            implicitWidth: Settings.bar.align.isHorizontal ? screen.width : Settings.bar.width + Settings.bar.margins.left + Settings.bar.margins.right
            implicitHeight: Settings.bar.align.isHorizontal ? Settings.bar.height + Settings.bar.margins.top + Settings.bar.margins.bottom : screen.height

            Item {
                id: base

                anchors.fill: parent

                anchors.topMargin: Settings.bar.align.isHorizontal ? Settings.bar.margins.top : 0
                anchors.leftMargin: Settings.bar.align.isVertical ? Settings.bar.margins.left : 0
                anchors.rightMargin: Settings.bar.align.isVertical ? Settings.bar.margins.right : 0
                anchors.bottomMargin: Settings.bar.align.isHorizontal ? Settings.bar.margins.bottom : 0

                RowLayout {
                    anchors.fill: parent
                    Item {
                        id: leftSection

                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        RowLayout {
                            anchors.fill: parent

                            Logo {}

                            MRectangle {
                                Layout.fillHeight: true
                                Layout.preferredWidth: workspaces.implicitWidth + Settings.item.margin * 2

                                Workspaces {
                                    id: workspaces
                                    anchors.centerIn: parent
                                }
                            }

                            MediaPlayer {}

                            MFillLayout {}
                        }
                    }

                    Item {
                        id: middleSection

                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        RowLayout {
                            anchors.fill: parent
                            MFillLayout {}

                            Clock {
                                Layout.alignment: Qt.AlignCenter
                            }

                            MFillLayout {}
                        }
                    }

                    Item {
                        id: rightSection

                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        RowLayout {
                            anchors.fill: parent

                            MFillLayout {}

                            MRectangle {
                                Layout.fillHeight: true
                                Layout.preferredWidth: key.implicitWidth + Settings.item.margin * 2

                                KeyboardInfo {
                                    id: key
                                    anchors.centerIn: parent
                                }
                            }

                            MRectangle {
                                Layout.fillHeight: true
                                Layout.preferredWidth: vol.implicitWidth + Settings.item.margin * 2

                                VolumeInfo {
                                    id: vol
                                    anchors.centerIn: parent
                                }
                            }

                            MRectangle {
                                visible: SPower.isBattery()

                                Layout.fillHeight: true
                                Layout.preferredWidth: bat.implicitWidth + Settings.item.margin * 2

                                BatteryInfo {
                                    id: bat
                                    anchors.centerIn: parent
                                }
                            }

                            MRectangle {
                                Layout.fillHeight: true
                                Layout.preferredWidth: 100

                                SystemTray {
                                    id: sys
                                    anchors.fill: parent
                                }

                                Component.onCompleted: {
                                    Layout.preferredWidth = sys.width;
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
                    }
                }
            }
        }
    }
}
