import QtQuick
import QtQuick.Controls

import qs.common

CheckBox {
    id: root

    signal check
    signal uncheck

    containmentMask: this.indicator

    indicator: MRectangle {
        implicitWidth: Settings.fontSize * 2 + 4
        implicitHeight: implicitWidth

        anchors.top: parent.top
        anchors.left: parent.left
        anchors.margins: Settings.itemMargin

        radius: 2
        color: Theme.colorOnSurface

        MRectangle {
            id: inner
            width: Settings.fontSize * 2 - 4
            height: width
            anchors.centerIn: parent
            radius: 4

            color: Theme.colorPrimary
            visible: root.checked
        }

        MouseArea {
            anchors.fill: parent

            onClicked: () => {
                if (inner.visible)
                    root.uncheck();
                else
                    root.check();
            }
        }
    }

    contentItem: MText {
        text: root.text

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        anchors.top: root.indicator.top
        // anchors.left: root.indicator.right

        leftPadding: root.indicator.width + root.spacing

        wrapMode: Text.WordWrap
    }
}
