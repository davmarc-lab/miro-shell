import Quickshell.Widgets

import QtQuick
import QtQuick.Layouts

import qs.widgets

WrapperItem {
    id: root

    required property string key
    required property string value

    ColumnLayout {
        anchors.fill: parent

        MText {
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: root.key
            font.bold: true
        }

        MText {
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: root.value
        }
    }
}
