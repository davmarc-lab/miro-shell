import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

Scope {
    Variants {
        model: Quickshell.screens

        MPanelWindow {
            id: root

            required property var modelData
            screen: modelData

            anchors {
                top: true
                left: true
                right: true
            }

            implicitWidth: screen.width
            implicitHeight: Settings.barHeight

            RowLayout {
                id: content
                anchors.fill: parent

                BarSection {
                    id: left
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignLeft

                    Logo {
                    }

                    BarItemRow {
                        MRectangle {
                            color: "red"
                        }
                    }
                    BarItemRow {
                        MRectangle {
                            color: "white"
                        }
                    }
                }

                BarSection {
                    id: center
                    Layout.alignment: Qt.AlignVCenter | Qt.AlignHCenter

                    BarItemRow {
                        MRectangle {
                            id: foo

                            color: "gray"

                            radius: Settings.buttonSoftRadius
                        }
                    }
                }

                BarSection {
                    id: right
                    Layout.alignment: Qt.AlignRight

                    BarItemRow {
                        MRectangle {
                            color: "red"
                        }

                        MRectangle {
                            color: "green"
                        }
                    }

                    MRectangle {
                        color: "blue"
                    }

                    BarItemRow {
                        Layout.alignment: Qt.AlignRight
                        MButton {
                            text: STime.day
                        }
                        MButton {
                            text: STime.time
                        }
                    }
                }
            }
        }
    }
}
