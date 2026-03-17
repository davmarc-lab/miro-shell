import QtQuick
import QtQuick.Layouts

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
        Layout.topMargin: Settings.barHeight

        color: Theme.colorSurface

        MRectangle {
            id: back
            anchors.fill: parent
            anchors.margins: Settings.itemMargin

            RowLayout {
                anchors.fill: parent

                ColumnLayout {
                    id: leftSide
                    Layout.alignment: Qt.AlignLeft
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.margins: Settings.itemMargin

                    MRectangle {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        color: Theme.colorPrimary

                        ColumnLayout {
                            id: timeDate
                            anchors.fill: parent
                            anchors.margins: Settings.itemMargin

                            Item {
                                id: time
                                Layout.alignment: Qt.AlignHCenter
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                MText {
                                    anchors.centerIn: parent
                                    text: STime.time
                                    color: Theme.colorOnPrimary
                                }
                            }

                            Item {
                                id: date
                                Layout.alignment: Qt.AlignHCenter
                                Layout.fillWidth: true
                                Layout.fillHeight: true
                                MText {
                                    anchors.centerIn: parent
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
                            MIconButton {
                                Layout.preferredWidth: Layout.preferredHeight
                                Layout.preferredHeight: Settings.rightIconsSize
                                iconName: "settings.svg"

                                onIconClick: {
                                    Global.enableDock = false;
                                    Global.enableSettings = true;
                                }
                            }

                            MIconButton {
                                Layout.preferredWidth: Layout.preferredHeight
                                Layout.preferredHeight: Settings.rightIconsSize
                                iconName: "wallpaper.svg"

                                onIconClick: {
                                    Global.enableDock = false;
                                    Global.enableWPSelector = true;
                                }
                            }

                            MIconButton {
                                Layout.preferredWidth: Layout.preferredHeight
                                Layout.preferredHeight: Settings.rightIconsSize
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
                                    STodo.addTodo("prova", false);
                                }
                            }
                        }
                    }
                }

                MRectangle {
                    id: middle
                    Layout.preferredWidth: parent.width * 0.6
                    Layout.fillHeight: true
                    Layout.margins: Settings.itemMargin

                    ColumnLayout {
                        anchors.fill: parent

                        MRectangle {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            color: Theme.colorSurface

                            RowLayout {
                                anchors.fill: parent
                                anchors.margins: Settings.itemMargin

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
                                        anchors.margins: Settings.itemMargin

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
                                            text: SUser.getUsername()
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
