import QtQuick
import QtQuick.Layouts

import Quickshell

import qs
import qs.common
import qs.widgets
import qs.services

MPopup {
    id: root

    onOpenChanged: {
        Global.enableDock = this.open;
    }

    MRectangle {
        Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
        Layout.preferredWidth: root.screen.width * 0.3
        Layout.preferredHeight: root.screen.height * 0.3
        Layout.topMargin: Settings.bar.height

        color: Theme.colorSurface

        MRectangle {
            id: back
            anchors.fill: parent
            anchors.margins: Settings.item.margin

            RowLayout {
                anchors.fill: parent

                ColumnLayout {
                    id: leftSide
                    Layout.alignment: Qt.AlignLeft
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: Settings.item.margin

                    MRectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: Theme.colorPrimary

                        ColumnLayout {
                            id: timeDate
                            anchors.fill: parent
                            anchors.margins: Settings.item.margin

                            Item {
                                id: time
                                Layout.alignment: Qt.AlignHCenter
                                Layout.fillWidth: true
                                Layout.preferredHeight: childrenRect.height
                                ColumnLayout {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    spacing: 0

                                    MText {
                                        id: hour
                                        font.pointSize: 40
                                        text: STime.hour
                                        color: Theme.colorOnPrimary
                                    }

                                    MText {
                                        font.pointSize: hour.font.pointSize
                                        text: STime.minute
                                        color: Theme.colorOnPrimary
                                    }
                                }
                            }

                            Item {
                                id: date
                                Layout.alignment: Qt.AlignHCenter
                                Layout.fillWidth: true
                                Layout.preferredHeight: childrenRect.height
                                MText {
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    font.pointSize: 18
                                    text: STime.date
                                    color: Theme.colorOnPrimary
                                }
                            }
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        GridLayout {
                            anchors.centerIn: parent
                            rows: 1
                            columns: 4
                            MThemeIconButton {
                                Layout.preferredWidth: Layout.preferredHeight
                                Layout.preferredHeight: Settings.rightPanel.iconSize
                                iconName: "settings.svg"

                                onIconClick: {
                                    Global.enableDock = false;
                                    Global.enableSettings = true;
                                }
                            }

                            MThemeIconButton {
                                Layout.preferredWidth: Layout.preferredHeight
                                Layout.preferredHeight: Settings.rightPanel.iconSize
                                iconName: "wallpaper.svg"

                                onIconClick: {
                                    Global.enableDock = false;
                                    Global.enableWPSelector = true;
                                }
                            }

                            MThemeIconButton {
                                Layout.preferredWidth: Layout.preferredHeight
                                Layout.preferredHeight: Settings.rightPanel.iconSize
                                iconName: "power.svg"

                                onIconClick: {
                                    Global.enableDock = false;
                                    Global.enablePowerMenu = true;
                                }
                            }

                            MButton {
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                text: "UT"
                                onClicked: {
                                    // Global.enableUtility = !Global.enableUtility;
                                }
                            }
                        }
                    }
                }

                MRectangle {
                    id: middle
                    Layout.preferredWidth: parent.width * 0.6
                    Layout.fillHeight: true
                    Layout.margins: Settings.item.margin

                    ColumnLayout {
                        anchors.fill: parent

                        MRectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: Theme.colorSurface

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: Settings.item.margin

                                MRIcon {
                                    cache: true
                                    mipmap: true
                                    dir: SUser.getUserImageDir()
                                    name: SUser.getUserImageFile()
                                    Layout.preferredWidth: 100
                                    Layout.preferredHeight: 100
                                }

                                MRectangle {
                                    Layout.fillWidth: true
                                    Layout.fillHeight: true

                                    ColumnLayout {
                                        id: info
                                        anchors.fill: parent
                                        anchors.margins: Settings.item.margin

                                        MFillLayout {}

                                        MText {
                                            id: name
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: contentHeight
                                            Layout.alignment: Qt.AlignVCenter
                                            text: SUser.getName() + " " + SUser.getSecondName()
                                        }

                                        MText {
                                            id: username
                                            Layout.fillWidth: true
                                            Layout.preferredHeight: contentHeight
                                            Layout.alignment: Qt.AlignVCenter
                                            text: Quickshell.env("USER")
                                        }

                                        MFillLayout {}
                                    }
                                }
                            }
                        }

                        MRectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: Theme.colorSurface
                        }
                    }
                }
            }
        }
    }
}
