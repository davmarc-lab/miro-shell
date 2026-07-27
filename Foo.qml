import Quickshell
import Quickshell.Networking

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

FloatingWindow {
    id: root
    visible: true

    color: "transparent"

    ColumnLayout {
        anchors.fill: parent

        MRectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: parent.height * 0.4

            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Settings.panel.margin

                MThemeIconButton {
                    iconName: "wifi"

                    Layout.fillHeight: true
                    Layout.fillWidth: true
                    Layout.maximumHeight: parent.height * 0.1
                    Layout.maximumWidth: parent.width * 0.4

                    onIconClick: {}
                }

                Item {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    ListView {
                        id: listView
                        anchors.fill: parent
                        model: SNetwork.getAvailableNetworks()
                        spacing: 8
                        clip: true

                        delegate: MRectangle {
                            id: delegateRect
                            required property int index
                            required property var modelData

                            property bool expanded: false

                            width: ListView.view.width
                            height: 2 * Settings.item.margin + (expanded ? topRow.implicitHeight + expandedContent.height + Settings.item.margin : topRow.implicitHeight)

                            color: Theme.colorSurface

                            RowLayout {
                                id: topRow
                                anchors.top: parent.top
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.margins: Settings.item.margin

                                MText {
                                    id: titleText
                                    text: delegateRect.modelData.name
                                    wrapMode: Text.WordWrap
                                    Layout.fillWidth: true
                                    Layout.alignment: Qt.AlignVCenter
                                }

                                MThemeIconButton {
                                    id: expandButton
                                    Layout.alignment: Qt.AlignVCenter
                                    Layout.fillHeight: true
                                    Layout.preferredWidth: this.height

                                    iconName: delegateRect.expanded ? "down-arrow" : "right-arrow"

                                    onIconClick: {
                                        delegateRect.expanded = !delegateRect.expanded;
                                    }
                                }
                            }

                            MRectangle {
                                id: expandedContent
                                anchors.top: topRow.bottom
                                anchors.left: parent.left
                                anchors.right: parent.right
                                anchors.margins: Settings.item.margin
                                height: delegateRect.expanded ? expandedArea.implicitHeight + 2 * Settings.item.margin : 0
                                clip: true
                                visible: delegateRect.expanded

                                RowLayout {
                                    id: expandedArea
                                    anchors.left: parent.left
                                    anchors.right: parent.right
                                    anchors.top: parent.top
                                    anchors.margins: Settings.item.margin

                                    MText {
                                        id: expandedText
                                        Layout.alignment: Qt.AlignVCenter
                                        text: "Password"
                                    }

                                    MTextInput {
                                        isPassword: true
                                        Layout.fillWidth: true
                                        Layout.fillHeight: true
                                    }

                                    MButton {
                                        text: "Send"
                                    }
                                }
                            }
                        }
                    }

                    // ListView {
                    //     anchors.fill: parent

                    //     model: SNetwork.getAvailableNetworks()
                    //     clip: true
                    //     spacing: Settings.item.margin

                    //     delegate: Item {
                    //         id: item

                    //         required property var modelData

                    //         width: ListView.view.width
                    //         height: content.height + passForm.height + Settings.item.margin

                    //         MRectangle {
                    //             anchors.fill: parent
                    //             color: "red"

                    //             RowLayout {
                    //                 id: content

                    //                 anchors {
                    //                     left: parent.left
                    //                     right: parent.right
                    //                     verticalCenter: parent.verticalCenter
                    //                     margins: Settings.item.margin
                    //                 }

                    //                 MText {
                    //                     text: item.modelData.name
                    //                 }

                    //                 MFillLayout {}

                    //                 MText {
                    //                     visible: item.modelData.connected
                    //                     text: "--- connected ---"
                    //                 }

                    //                 MFillLayout {}

                    //                 MText {
                    //                     visible: item.modelData.device.type === DeviceType.Wifi
                    //                     text: item.modelData.signalStrength
                    //                 }

                    //                 MButton {
                    //                     text: item.modelData.connected ? "D" : "C"
                    //                     onClicked: {
                    //                         if (this.text === "C") {
                    //                             passForm.visible = !passForm.visible;
                    //                         }
                    //                     }
                    //                 }
                    //             }

                    //             MRectangle {
                    //                 id: passForm
                    //                 visible: false
                    //                 anchors {
                    //                     top: content.bottom
                    //                     left: parent.left
                    //                     right: parent.right
                    //                     bottom: parent.bottom
                    //                 }
                    //                 height: visible ? sample.height + Settings.item.margin * 2 : 0

                    //                 MText {
                    //                     id: sample
                    //                     anchors {
                    //                         top: parent.top
                    //                         left: parent.left
                    //                         right: parent.right
                    //                         margins: Settings.item.margin
                    //                     }
                    //                     text: "Sample Text"
                    //                 }

                    //                 // RowLayout {
                    //                 //     anchors.fill: parent
                    //                 //     anchors.margins: Settings.item.margin

                    //                 //     MText {
                    //                 //         text: "Password"
                    //                 //     }

                    //                 //     MTextInput {
                    //                 //         isPassword: true
                    //                 //         Layout.fillWidth: true
                    //                 //     }

                    //                 //     MButton {
                    //                 //         text: "Enter"
                    //                 //     }
                    //                 // }
                    //             }
                    //         }

                    //         Component.onCompleted: {
                    //             console.log(item.modelData.name);
                    //         }
                    //     }
                    // }
                }
            }
        }
    }
}
