import QtQuick
import QtQuick.Layouts

import qs.common

Item {
    id: root
    property string text: "Color"
    required property string color

    signal onColorChanged

    RowLayout {
        anchors.fill: parent
        anchors.margins: Settings.item.margin

        spacing: Settings.item.margin

        MText {
            Layout.alignment: Qt.AlignLeft | Qt.AlignVCenter
            text: root.text
        }

        MFillLayout {}

        MTextInput {
            id: colorVal
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter

            Layout.fillWidth: true
            Layout.maximumWidth: 100
            text: root.color

            onTextEdited: {
                root.color = text;
                root.onColorChanged();
            }

            onAccepted: this.focus = false
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignRight | Qt.AlignVCenter
            Layout.preferredWidth: 50
            Layout.maximumHeight: colorVal.height

            border.color: Theme.colorOutline
            border.width: 2

            color: colorVal.text
        }
    }
}
