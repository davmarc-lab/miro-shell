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

                    MTextArea {
                        Layout.fillWidth: true

                        placeholderText: "foo"
                    }

                    MKeyValText {
                        key: "Key"
                        value: "Value"
                    }

                    MColorEdit {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 50
                        text: "Color Edit"
                        color: "#ff0000"
                    }

                    RowLayout {
                        MCheckBox {
                            text: "Checkbox"
                            onCheck: checked = true
                            onUncheck: checked = false
                        }

                        MSwitch {
                            checked: false
                        }
                    }

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.preferredHeight: 100
                        Layout.margins: 10
                        MSlider {
                            Layout.fillWidth: true
                            Layout.maximumWidth: parent.width / 2
                        }

                        MSlider {
                            Layout.fillWidth: true
                            Layout.preferredHeight: 100
                            isVertical: true
                        }
                    }
                }
            }
        }
    }
}
