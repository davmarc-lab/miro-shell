pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

ApplicationWindow {
    id: root

    topPadding: 0

    visible: Global.enableSettings

    color: Theme.colorSurface

    onClosing: {
        Global.enableSettings = false;
    }

    property var sections: [
        {
            text: "Theme",
            content: "ThemeSettings.qml"
        },
        {
            text: "Interface",
            content: "UiSettings.qml"
        }
    ]
    property int currentSection: 0

    onCurrentSectionChanged: {
        contentLoader.source = root.sections[root.currentSection].content;
    }

    MRectangle {
        anchors.fill: parent
        implicitWidth: parent.width * 0.6

        radius: Settings.itemRadius

        color: root.color

        RowLayout {
            anchors.fill: parent
            anchors.topMargin: Settings.panelMargin
            anchors.bottomMargin: anchors.topMargin
            anchors.leftMargin: Settings.panelMargin
            anchors.rightMargin: anchors.leftMargin

            spacing: Settings.panelMargin

            Rectangle {
                id: indexPanel
                Layout.fillHeight: true
                Layout.minimumWidth: 200
                implicitWidth: parent.width * 0.3

                color: Theme.colorSurfaceVariant

                radius: Settings.itemRadius

                // pages section indexing
                ColumnLayout {
                    id: pages
                    anchors {
                        top: parent.top
                        // bottom: parent.bottom
                        left: parent.left
                        right: parent.right
                    }

                    anchors.topMargin: Settings.panelMargin
                    anchors.bottomMargin: anchors.topMargin
                    anchors.leftMargin: Settings.panelMargin
                    anchors.rightMargin: anchors.leftMargin

                    Repeater {
                        model: root.sections

                        delegate: IndexItem {
                            id: item
                            required property int index
                            required property var modelData

                            entry: modelData.text

                            onClicked: {
                                root.currentSection = index;
                            }
                        }
                    }
                }

                // close buttom at the bottom
                MButton {
                    id: close

                    anchors.bottom: parent.bottom
                    anchors.left: parent.left
                    anchors.right: parent.right

                    anchors.topMargin: Settings.panelMargin
                    anchors.bottomMargin: anchors.topMargin
                    anchors.leftMargin: Settings.panelMargin
                    anchors.rightMargin: anchors.leftMargin

                    text: "Close"

                    onClicked: {
                        Global.enableSettings = false;
                    }
                }
            }

            Rectangle {
                id: contentPanel
                Layout.fillHeight: true
                Layout.fillWidth: true

                color: Theme.colorSurfaceVariant

                radius: Settings.itemRadius

                Loader {
                    id: contentLoader
                    anchors.fill: contentPanel

                    active: true
                    Component.onCompleted: {
                        if (root.currentSection >= 0)
                            source = root.sections[root.currentSection].content;
                    }
                }
            }
        }
    }
}
