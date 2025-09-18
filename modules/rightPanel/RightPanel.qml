import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

MPopup {
    id: root

    MRectangle {
        id: panel
        Layout.alignment: Qt.AlignRight

        Layout.preferredWidth: parent.width * 0.25
        Layout.fillHeight: true
        Layout.topMargin: Settings.barHeight

        topRightRadius: 0
        bottomRightRadius: 0

        color: Theme.colorSurface

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Settings.panelMargin
            spacing: Settings.panelMargin

            MRectangle {
                id: controlsBack
                Layout.preferredHeight: itemsArea.isExpanded() ? panel.height * 0.3 : controls.height + 2 * Settings.itemMargin
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
                        Layout.margins: Settings.itemMargin
                        spacing: Settings.itemMargin

                        // Layout.alignment: Qt.AlignHCenter

                        ControlButton {
                            id: foo
                            name: "wifi.svg"
                            onIconClick: {
                                itemsArea.tryExpand(name);
                                if (itemsArea.isExpanded()) {
                                    SNetwork.dump();
                                }
                            }
                        }

                        ControlButton {
                            name: "bluetooth.svg"
                            onIconClick: {
                                itemsArea.tryExpand(name);
                                SNetwork.scanWifi();
                            }
                        }

                        ControlButton {
                            name: "sun.svg"
                            onIconClick: {
                                itemsArea.tryExpand(name);
                            }
                        }

                        ControlButton {
                            name: "moon.svg"
                            onIconClick: {
                                itemsArea.tryExpand(name);
                            }
                        }
                    }

                    Item {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        Layout.margins: Settings.itemMargin
                        Layout.topMargin: 0

                        MRectangle {
                            anchors.fill: parent

                            LazyLoader {
                                active: itemsArea.expand
                                component: {
                                    return null;
                                }
                            }
                        }
                        visible: itemsArea.isExpanded()
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
                    anchors.margins: Settings.itemMargin

                    MTitle {
                        Layout.fillWidth: true
                        Layout.preferredHeight: this.height

                        text: "Notifications"
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
