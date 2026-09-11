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
        Layout.topMargin: Settings.bar.size

        color: Theme.colorSurface

        focus: true
        Keys.onEscapePressed: root.open = false

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
                                        font.pixelSize: 40
                                        text: STime.hour
                                        color: Theme.colorOnPrimary
                                    }

                                    MText {
                                        font.pixelSize: hour.font.pixelSize
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

                            MRectangle {
                                id: settings
                                Layout.preferredHeight: Settings.rightPanel.iconSize
                                Layout.preferredWidth: height
                                color: Theme.colorPrimary

                                MFontIcon {
                                    anchors.fill: parent
                                    icon: "settings"
                                    color: Theme.colorOnPrimary
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        Global.enableDock = false;
                                        Global.enableSettings = true;
                                    }
                                    hoverEnabled: true
                                    onEntered: settings.color = Theme.colorPrimaryHover
                                    onExited: settings.color = Theme.colorPrimary
                                }
                            }

                            MRectangle {
                                id: wps
                                Layout.preferredHeight: Settings.rightPanel.iconSize
                                Layout.preferredWidth: height
                                color: Theme.colorPrimary

                                MFontIcon {
                                    anchors.fill: parent
                                    icon: "gallery"
                                    color: Theme.colorOnPrimary
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        Global.enableDock = false;
                                        Global.enableWPSelector = true;
                                    }
                                    hoverEnabled: true
                                    onEntered: wps.color = Theme.colorPrimaryHover
                                    onExited: wps.color = Theme.colorPrimary
                                }
                            }

                            MRectangle {
                                id: power
                                Layout.preferredHeight: Settings.rightPanel.iconSize
                                Layout.preferredWidth: height
                                color: Theme.colorPrimary

                                MFontIcon {
                                    anchors.fill: parent
                                    icon: "power"
                                    iconWeight: 800
                                    color: Theme.colorOnPrimary
                                }

                                MouseArea {
                                    anchors.fill: parent
                                    onClicked: {
                                        Global.enableDock = false;
                                        Global.enablePowerMenu = true;
                                    }
                                    hoverEnabled: true
                                    onEntered: power.color = Theme.colorPrimaryHover
                                    onExited: power.color = Theme.colorPrimary
                                }
                            }

                            MButton {
                                Layout.preferredWidth: Layout.preferredHeight
                                Layout.preferredHeight: Settings.rightPanel.iconSize
                                onClicked: SNotification.sendNotification("Foo", "Testing send notification", 2)
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
