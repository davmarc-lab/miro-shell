pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

// change to CApplicationWindow
MFloating {
    id: root

    property var sections: [
        {
            text: "Theme",
            content: "ThemeSettings.qml"
        },
        {
            text: "World",
            content: "World.qml"
        }
    ]
    property int currentSection: 0

    onCurrentSectionChanged: {
        contentLoader.source = root.sections[root.currentSection].content;
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.topMargin: Settings.panelMargin
        anchors.bottomMargin: anchors.topMargin
        anchors.leftMargin: Settings.panelMargin
        anchors.rightMargin: anchors.leftMargin

        spacing: Settings.panelMargin

        Rectangle {
            Layout.alignment: Qt.AlignHCenter
            Layout.fillHeight: true
            Layout.minimumWidth: 1000
            implicitWidth: parent.width * 0.6

            radius: Settings.itemRadius

            color: Theme.colorOutline

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

                    ColumnLayout {
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
}
