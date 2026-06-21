import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

MPopup {
    id: root

    readonly property list<string> sources: ["Todo", "Calendar", "Mixer", "Docker"]

    onOpenChanged: {
        Global.enableUtility = this.open;
    }

    MRectangle {
        Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
        Layout.preferredWidth: Settings.utilityPanel.width
        Layout.preferredHeight: Settings.utilityPanel.height

        bottomLeftRadius: 0
        topLeftRadius: 0

        color: Theme.colorSurface

        ColumnLayout {
            id: base
            anchors.fill: parent
            anchors.margins: Settings.panel.margin

            spacing: Settings.panel.margin

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
                            content.index = 0;
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
                            content.index = 1;
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
                            content.index = 2;
                        }
                    }
                }

                MRectangle {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MText {
                        anchors.centerIn: parent
                        text: "Docker"
                    }

                    MouseArea {
                        anchors.fill: parent

                        onClicked: {
                            content.index = 3;
                        }
                    }
                }
            }

            MRectangle {
                id: content
                property int index: 0

                Layout.fillWidth: true
                Layout.fillHeight: true

                radius: 0

                Todo {
                    anchors.fill: parent
                    visible: root.sources[content.index].toString() === "Todo"
                }

                Calendar {
                    anchors.fill: parent
                    visible: root.sources[content.index].toString() === "Calendar"
                    onIsFocusedChanged: console.log(isFocused)
                }

                Mixer {
                    anchors.fill: parent
                    visible: root.sources[content.index].toString() === "Mixer"
                }

                Docker {
                    anchors.fill: parent
                    visible: root.sources[content.index].toString() === "Docker"
                }
            }
        }

        focus: true

        Keys.onEscapePressed: Global.enableUtility = false

        // Keys.onPressed: event => {
        //     // next section
        //     if (event.key === Qt.Key_N && event.modifiers === Qt.ControlModifier) {
        //         content.index = (content.index + 1) % root.sources.length;
        //     }
        //     // prev section
        //     if (event.key === Qt.Key_P && event.modifiers === Qt.ControlModifier) {
        //         content.index = (content.index + root.sources.length - 1) % root.sources.length;
        //     }
        // }
    }
}
