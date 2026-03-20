import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root

    required property var item

    width: ListView.view.width
    height: layout.height

    RowLayout {
        id: layout
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: Settings.itemMargin

        MText {
            text: root.item.name
        }
    }
}
