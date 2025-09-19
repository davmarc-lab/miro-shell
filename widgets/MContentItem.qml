import QtQuick
import QtQuick.Layouts

Item {
    id: root

    required property real sizex
    required property real sizey

    Layout.alignment: Qt.AlignTop | Qt.AlignHCenter
    Layout.preferredWidth: root.sizex
    Layout.preferredHeight: root.sizey
}
