pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

MFloating {
    id: root

    visible: Global.enableSettings
    color: Theme.colorSurface

    title: "Miro Settings"

    // height: Screen.height / 2
    // width: Screen.width / 2

    // onClosing: {
    //     Global.enableSettings = false;
    // }

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
    property int currentSection: 2

    onCurrentSectionChanged: {
        contentLoader.source = root.sections[root.currentSection].content;
    }

    Item {
        id: leftPanel

        // maximum width of all delegates
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

            ListView {
                id: indexList
                anchors.fill: parent
                anchors.margins: Settings.item.margin

                clip: true
                model: root.sections
                spacing: Settings.item.margin

                delegate: IndexItem {
                    id: item

                    width: leftPanel.maxItemWidth

                    required property int index
                    required property var modelData

                    entry: modelData.text
                    iconName: modelData.icon
                    iconFill: modelData.iconFill
                    open: root.currentSection == index

                    // monitor items width and update the shared maximum
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
