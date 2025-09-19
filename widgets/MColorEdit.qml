import QtQuick
import QtQuick.Layouts

RowLayout {
    id: root

    property string text: "Color"
    required property string color

    property var itemWidth: parent.width / 3

    signal onColorChanged

    MText {
        Layout.alignment: Qt.AlignLeft
        Layout.preferredWidth: root.itemWidth
        Layout.fillHeight: true

        text: root.text
    }

    MTextInput {
        id: colorVal
        Layout.alignment: Qt.AlignHCenter
        Layout.preferredWidth: root.itemWidth
        Layout.fillHeight: true

        text: root.color

        onTextEdited: {
            root.color = text;
            root.onColorChanged();
        }
    }

    Rectangle {
        Layout.alignment: Qt.AlignRight
        Layout.preferredWidth: 50
        Layout.fillHeight: true

        color: colorVal.text
    }
}
