import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

MRectangle {
    radius: 0

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.panelMargin

        MTitle {
            Layout.fillWidth: true
            // Layout.fillHeight: true
            text: "Containers"
        }

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            model: SDocker.getData()
            spacing: Settings.itemMargin * 2

            delegate: MRectangle {
                id: item
                required property var modelData
                width: ListView.view.width
                height: childrenRect.height + 2 * Settings.itemMargin
                color: Theme.colorSurface

                ColumnLayout {
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.margins: Settings.itemMargin

                    RowLayout {
                        Layout.fillWidth: true

                        MTitle {
                            text: "Name"
                            subtitle: true
                        }
                        MText {
                            text: item.modelData.Names
                        }

                        MFillLayout {}

                        MTitle {
                            text: "ID"
                            subtitle: true
                        }
                        MText {
                            text: item.modelData.ID
                        }

                        MFillLayout {}

                        MTitle {
                            text: "Image"
                            subtitle: true
                        }
                        MText {
                            text: item.modelData.Image
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true

                        MTitle {
                            text: "Size"
                            subtitle: true
                        }
                        MText {
                            text: item.modelData.Size
                        }

                        MFillLayout {}

                        MTitle {
                            text: "State"
                            subtitle: true
                        }
                        MText {
                            id: state
                            text: item.modelData.State
                        }

                        MFillLayout {}

                        MTitle {
                            text: "Status"
                            subtitle: true
                        }
                        MText {
                            text: item.modelData.Status
                        }
                    }

                    MButton {
                        id: start
                        visible: state.text === "exited"
                        text: "Start"
                        Layout.alignment: Qt.AlignHCenter
                    }

                    MButton {
                        id: stop
                        visible: state.text === "running"
                        text: "Stop"
                        Layout.alignment: Qt.AlignHCenter
                        bgColor: Theme.colorError
                    }
                }
            }
        }
    }
}
