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
        Global.enableUtility = this.open;
    }

    MRectangle {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        Layout.preferredWidth: Settings.utilityPanelWidth
        Layout.preferredHeight: Settings.utilityPanelHeight

        bottomLeftRadius: 0
        topLeftRadius: 0

        color: Theme.colorSurface

        ColumnLayout {
            id: base
            anchors.fill: parent
            anchors.margins: Settings.panelMargin

            spacing: Settings.panelMargin

            RowLayout {
                id: head
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignTop
                Layout.maximumHeight: parent.height * 0.1

                MRectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MText {
                        anchors.centerIn: parent
                        text: "TODO"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            content.setSource("Todo.qml");
                        }
                    }
                }

                MRectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MText {
                        anchors.centerIn: parent
                        text: "Weather"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            content.setSource("Weather.qml");
                        }
                    }
                }

                MRectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MText {
                        anchors.centerIn: parent
                        text: "Mixer"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            content.setSource("Mixer.qml");
                        }
                    }
                }

                MRectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MText {
                        anchors.centerIn: parent
                        text: "Calendar"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            content.setSource("Calendar.qml");
                        }
                    }
                }
            }

            MRectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: 0

                Loader {
                    id: content
                    anchors.fill: parent
                    source: "Todo.qml"
                }
            }
        }
    }
}
