import QtQuick
import QtQuick.Controls

import qs.common

CheckBox {
    id: root

    indicator: MRectangle {
        implicitWidth: Settings.fontSize * 2 + 4
        implicitHeight: implicitWidth

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: Settings.itemMargin

        radius: 2
        color: Theme.colorOnSurface

        MRectangle {
            width: Settings.fontSize * 2 - 4
            height: width
            anchors.centerIn: parent
            radius: 4

            color: Theme.colorPrimary
            visible: root.checked
        }
    }

    contentItem: MText {
        text: root.text

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.top: root.indicator.top

        leftPadding: root.indicator.width + root.spacing

        wrapMode: Text.WordWrap
    }
}
