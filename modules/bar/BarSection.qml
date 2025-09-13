
import QtQuick
import QtQuick.Layouts

Item {
    id: root

    default property alias items: content.children

    Layout.fillWidth: true
    Layout.fillHeight: true

    RowLayout {
        id: content
        anchors.fill: parent
    }
}
