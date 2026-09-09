pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import qs.common
import qs.widgets
import "./theme/"

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
            title: "Theme Style"

            Layout.bottomMargin: 0
            Layout.topMargin: 0

            property real itemWidth: root.width * 0.7
            property real itemHeight: 30

            customWidth: itemWidth

            MContentItem {
                sizex: content.itemWidth
                sizey: content.itemHeight

                RowLayout {
                    anchors.fill: parent
                    MText {
                        id: themeText
                        text: "Dark Mode"
                    }

                    MSwitch {
                        id: themeSwitch
                        Layout.alignment: Qt.AlignRight
                        checked: isDark

                        property bool isDark: Theme.themeStyle == "dark"

                        onCheckedChanged: {
                            Theme.themeStyle = this.checked ? "dark" : "light";
                        }
                    }
                }
            }

            LightThemeEdit {
                from: content
                visible: !themeSwitch.isDark
            }

            DarkThemeEdit {
                from: content
                visible: themeSwitch.isDark
            }

            // // FILLER
            // ContentItem {
            //     sizex: content.itemWidth
            //     sizey: content.itemHeight
            //
            //     Layout.fillHeight: true
            //
            //     Rectangle {
            //         anchors.fill: parent
            //         color: "transparent"
            //     }
            // }
        }
    }
}
