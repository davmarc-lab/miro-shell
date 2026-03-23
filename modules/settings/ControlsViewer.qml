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
        height: root.sizey - (2 * Settings.panelMargin)

        x: (width - content.itemWidth) / 2
        y: Settings.panelMargin

        MContentSection {
            id: content
            title: "Controls Viewer"

            Layout.bottomMargin: 0
            Layout.topMargin: 0

            property real itemWidth: root.width * 0.7
            property real itemHeight: 30

            customWidth: itemWidth

            MContentItem {
                sizex: content.itemWidth
                sizey: content.itemHeight

                ColumnLayout {
                    anchors.fill: parent
                    spacing: 10

                    RowLayout {
                        MButton {
                            text: "Button"
                        }

                        MRButton {
                            text: "Round"
                        }
                    }

                    MTitle {
                        text: "Title"
                    }

                    MTitle {
                        subtitle: true
                        text: "Sub Title"
                    }

                    MText {
                        text: "Text"
                    }

                    MTextInput {
                        text: "Text Input"
                    }

                    MKeyValText {
                        key: "Key"
                        value: "Value"
                    }

                    RowLayout {
                        MCheckBox {
                            text: "Checkbox"
                            onCheck: checked = true
                            onUncheck: checked = false
                        }

                        MSwitch {
                            content: "Switch"
                            checked: false
                        }
                    }

                    RowLayout {
                        MSlider {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                        }

                        MSlider {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            isVertical: true
                        }
                    }

                    MColorEdit {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        text: "Color Edit"
                        color: "#ff0000"
                    }
                }
            }
        }
    }
}
