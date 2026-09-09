import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.services
import qs.widgets

MRectangle {

    Layout.fillHeight: true
    Layout.preferredWidth: time.contentWidth + Settings.item.margin

    MText {
        id: time
        anchors.centerIn: parent
        anchors.left: parent.left
        anchors.right: parent.right
        text: STime.time
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            Global.enableDock = !Global.enableDock;
        }
    }
}
