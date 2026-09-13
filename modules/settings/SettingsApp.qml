pragma ComponentBehavior: Bound

import Quickshell.Widgets

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

MFloating {
    id: root

    visible: Global.enableSettings
    color: Theme.colorSurface

    title: "Miro Settings"
    implicitWidth: leftPanel.width + screen.width * .3
    implicitHeight: screen.height * .5

    onClosed: Global.enableSettings = false

    property var sections: [
        {
            text: "Theme",
            icon: "colorscheme",
            iconFill: false,
            content: "ThemeSettings.qml"
        },
        {
            text: "Interface",
            icon: "menu",
            iconFill: true,
            content: "UiSettings.qml"
        },
        {
            text: "Controls",
            icon: "controls",
            iconFill: false,
            content: "ControlsViewer.qml"
        }
    ]
    property int currentSection: 0

    onCurrentSectionChanged: {
        contentLoader.source = root.sections[root.currentSection].content;
    }

    Item {
        id: leftPanel

        property real maxItemWidth: 0

        width: maxItemWidth + (Settings.item.margin * 2)

        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            margins: Settings.panel.margin
        }

        MRectangle {
            anchors.fill: parent
            ColumnLayout {
                anchors.fill: parent
                anchors.margins: Settings.item.margin
                spacing: Settings.item.margin

                Item {
                    Layout.fillWidth: true
                    implicitHeight: shell.height

                    RowLayout {
                        anchors.fill: parent
                        MTitle {
                            id: shell
                            text: "Miro"
                            font.pixelSize: Settings.font.size * 1.5
                        }

                        MFillLayout {}

                        IconImage {
                            implicitSize: parent.height
                            source: Qt.resolvedUrl(Settings.dirs.icons + "miro-shell")
                            backer.cache: true
                        }
                    }
                }

                MDivider {}

                ListView {
                    id: indexList
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    Layout.topMargin: Settings.item.margin / 2
                    spacing: Settings.item.margin

                    clip: true

                    interactive: false
                    MouseArea {
                        anchors.fill: parent
                        onPressed: mouse => mouse.accepted = false
                        onReleased: mouse => mouse.accepted = false
                        onClicked: mouse => mouse.accepted = false
                        propagateComposedEvents: true

                        onWheel: wheel => {
                            if (wheel.angleDelta.y > 0) {
                                indexList.flick(0, 300);
                            } else {
                                indexList.flick(0, -300); // Scroll down
                            }
                        }
                    }

                    model: root.sections

                    delegate: IndexItem {
                        id: item

                        width: leftPanel.maxItemWidth

                        required property int index
                        required property var modelData

                        entry: modelData.text
                        iconName: modelData.icon
                        iconFill: modelData.iconFill
                        open: root.currentSection == index

                        Component.onCompleted: {
                            if (implicitWidth > leftPanel.maxItemWidth) {
                                leftPanel.maxItemWidth = implicitWidth;
                            }
                        }
                        onImplicitWidthChanged: {
                            if (implicitWidth > leftPanel.maxItemWidth) {
                                leftPanel.maxItemWidth = implicitWidth;
                            }
                        }

                        onClicked: {
                            root.currentSection = index;
                        }
                    }
                }

                MDivider {}

                MButton {
                    Layout.fillWidth: true
                    text: "Close"
                    onClicked: Global.enableSettings = false
                }
            }
        }
    }

    Item {
        id: rightPanel
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: leftPanel.right
            margins: Settings.panel.margin
        }

        MRectangle {
            anchors.fill: parent
            Loader {
                id: contentLoader
                anchors.fill: parent

                active: true
                Component.onCompleted: {
                    if (root.currentSection >= 0)
                        source = root.sections[root.currentSection].content;
                }
            }
        }
    }
}
