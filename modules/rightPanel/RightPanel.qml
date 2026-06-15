import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

MPopup {
    id: root

    onOpenChanged: {
        Global.enableRightPanel = this.open;
    }

    MRectangle {
        id: panel
        Layout.alignment: Qt.AlignRight

        Layout.preferredWidth: parent.width * 0.2
        Layout.fillHeight: true
        Layout.topMargin: Settings.bar.size

        topRightRadius: 0
        bottomRightRadius: 0

        color: Theme.colorSurface

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Settings.panel.margin
            spacing: Settings.panel.margin

            MRectangle {
                id: controlsBack
                Layout.preferredHeight: itemsArea.isExpanded() ? panel.height * 0.3 : controls.height + 2 * Settings.item.margin
                Layout.maximumHeight: parent.height * 0.3
                Layout.fillWidth: true

                ColumnLayout {
                    id: itemsArea
                    anchors.fill: parent

                    property bool expand: false
                    property string current: ""

                    function isExpanded(): bool {
                        return expand && current != "";
                    }

                    function tryExpand(name: string): void {
                        if (name == this.current) {
                            this.current = "";
                            this.expand = false;
                            return;
                        }

                        this.current = name;
                        this.expand = true;
                    }

                    function resetExpand(): void {
                        this.current = "";
                        this.expand = false;
                    }

                    RowLayout {
                        id: controls
                        Layout.fillWidth: true
                        Layout.margins: Settings.item.margin
                        spacing: Settings.item.margin

                        // Layout.alignment: Qt.AlignHCenter

                        ControlButton {
                            id: foo
                            name: "wifi.svg"
                            onIconClick: {
                                itemsArea.tryExpand("Wifi");
                                if (itemsArea.isExpanded()) {
                                    // SNetwork.dump();
                                }
                            }
                        }

                        ControlButton {
                            name: "bluetooth.svg"
                            onIconClick: {
                                itemsArea.tryExpand("Bluetooth");
                                // SNetwork.scanWifi();
                            }
                        }

                        ControlButton {
                            name: "moon.svg"
                            onIconClick: {
                                itemsArea.tryExpand("Disturb");
                            }
                        }

                        ControlButton {
                            name: "sun.svg"
                            onIconClick: {
                                Theme.toggleTheme();
                            }
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.margins: Settings.item.margin
                        Layout.topMargin: 0

                        Loader {
                            id: bar
                            active: itemsArea.expand
                            anchors.fill: parent

                            source: {
                                if (itemsArea.current != "")
                                    return itemsArea.current + ".qml";
                                return "";
                            }
                        }
                    }
                }
            }

            MRectangle {
                id: notifications
                Layout.fillHeight: true
                Layout.fillWidth: true

                // When mouse click here closes panel expanded from above
                MouseArea {
                    anchors.fill: parent

                    onClicked: {
                        itemsArea.resetExpand();
                    }
                }

                ColumnLayout {
                    anchors.fill: parent
                    anchors.margins: Settings.item.margin

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.alignment: Qt.AlignTop

                        MTitle {
                            Layout.fillWidth: true
                            Layout.alignment: Qt.AlignTop
                            // Layout.preferredHeight: this.height

                            text: "Notifications"
                            font.pointSize: Settings.font.titleSize + 8
                        }

                        MFillLayout {
                            dy: false
                        }

                        MSwitch {
                            id: dnd
                            checked: Global.enableNotifPopups

                            onClicked: Global.enableNotifPopups = this.checked
                        }
                    }

                    MDivider {
                        Layout.bottomMargin: Settings.item.margin
                    }

                    NotificationsContent {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                    }
                }
            }
        }
    }
}
