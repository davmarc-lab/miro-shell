import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

MPanelWindow {
    id: root

    exclusiveZone: 0

    anchors {
        top: true
        bottom: true
        right: true
    }

    implicitWidth: screen.width * 0.25

    ColumnLayout {
        id: panel
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

                    ControlButton {
                        name: "wifi.svg"
                        onIconClick: {
                            itemsArea.tryExpand(name);
                            if (itemsArea.isExpanded())
                                SNetwork.scanWifi();
                        }
                    }

                    ControlButton {
                        name: "bluetooth.svg"
                        onIconClick: {
                            itemsArea.tryExpand(name);
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
                            id: content
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
        }
    }
}
