pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.common
import qs.widgets

MContentItem {
    id: root

    sizex: parent.width
    sizey: parent.height

    ScrollView {
        width: root.sizex
        height: root.sizey - (2 * Settings.panel.margin)

        x: (width - content.itemWidth) / 2
        y: Settings.panel.margin

        MContentSection {
            id: content
            title: "Interface Settings"

            Layout.bottomMargin: 0
            Layout.topMargin: 0

            property real itemWidth: root.width * 0.7
            property real itemHeight: 30

            customWidth: itemWidth

            MContentSubSection {
                id: sBar
                title: "Bar"

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Bar Height"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.bar.height

                            onTextEdited: {
                                Settings.bar.height = this.text;
                            }
                        }
                    }
                }
            }

            MContentSubSection {
                id: sWorkspaces
                title: "Workspaces"

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Number of visible workspaces"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.workspaces.size

                            onTextEdited: {
                                Settings.workspaces.size = this.text;
                            }
                        }
                    }
                }
            }

            MContentSubSection {
                id: sPanels
                title: "Panels"

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Panel Margin"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.panel.margin

                            onTextEdited: {
                                Settings.panel.margin = this.text;
                            }
                        }
                    }
                }

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Items Margin"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.item.margin

                            onTextEdited: {
                                Settings.item.margin = this.text;
                            }
                        }
                    }
                }

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Items Radius"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.item.radius

                            onTextEdited: {
                                Settings.item.radius = this.text;
                            }
                        }
                    }
                }

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Thumbnail Width"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.thumbWidth

                            onTextEdited: {
                                Settings.thumbWidth = this.text;
                            }
                        }
                    }
                }

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Thumbnail Height"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.thumbHeight

                            onTextEdited: {
                                Settings.thumbHeight = this.text;
                            }
                        }
                    }
                }
            }

            MContentSubSection {
                id: sButtons
                title: "Buttons"

                MContentItem {
                    sizex: content.itemWidth
                    sizey: content.itemHeight

                    RowLayout {
                        anchors.fill: parent

                        MText {
                            Layout.alignment: Qt.AlignLeft
                            Layout.fillHeight: true
                            text: "Button Radius"
                        }

                        MTextInput {
                            Layout.alignment: Qt.AlignRight
                            Layout.fillHeight: true
                            text: Settings.button.radius

                            onTextEdited: {
                                Settings.button.radius = this.text;
                            }
                        }
                    }
                }
            }
        }
    }
}
