import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.services
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

        focus: true
        Keys.onEscapePressed: root.open = false

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Settings.panel.margin
            spacing: Settings.panel.margin

            MRectangle {
                id: controlsBack
                Layout.preferredHeight: itemsArea.isExpanded() ? panel.height * 0.3 : controls.height
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

                    ColumnLayout {
                        id: controls
                        Layout.fillWidth: true
                        spacing: 0

                        RowLayout {
                            id: topControls
                            Layout.fillWidth: true
                            Layout.margins: Settings.item.margin
                            spacing: Settings.item.margin

                            ControlButton {
                                Layout.fillWidth: true
                                text: SNetwork.current
                                iconName: "wifi.svg"
                                onClick: itemsArea.tryExpand("Network")
                            }

                            ControlButton {
                                Layout.fillWidth: true
                                text: "Bluetooth"
                                iconName: "bluetooth.svg"
                                onClick: itemsArea.tryExpand("Bluetooth")
                            }
                        }

                        RowLayout {
                            id: botControls
                            Layout.fillWidth: true
                            Layout.margins: Settings.item.margin
                            Layout.topMargin: 0
                            spacing: Settings.item.margin

                            ControlSwitch {
                                iconName: "moon.svg"
                                Layout.fillWidth: true
                                text: "Do Not Disturb"
                                checked: !Global.enableNotifPopups
                                onClick: Global.enableNotifPopups = !Global.enableNotifPopups
                            }

                            ControlSwitch {
                                iconName: "sun.svg"
                                Layout.fillWidth: true
                                text: "Dark Mode"
                                checked: Theme.isDark
                                onClick: Theme.toggleTheme()
                            }
                        }
                    }

                    // here the expanded content is loaded
                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.margins: Settings.item.margin
                        Layout.topMargin: 0

                        Network {
                            anchors.fill: parent
                            visible: itemsArea.current === "Network"
                        }

                        Bluetooth {
                            anchors.fill: parent
                            visible: itemsArea.current === "Bluetooth"
                        }

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

                            text: "Notifications"
                            font.pointSize: Settings.font.titleSize + 8
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
