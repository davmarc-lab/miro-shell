import QtQuick
import QtQuick.Layouts

import qs.widgets

ColumnLayout {
    spacing: 0
    TodoItem {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        text: "hello"
    }

    TodoItem {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        text: "Gioji"
    }

    TodoItem {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        text: "sei"
    }

    TodoItem {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        text: "un"
    }

    TodoItem {
        Layout.fillWidth: true
        Layout.alignment: Qt.AlignTop

        text: "gae"
    }

    MFillLayout {}
}
