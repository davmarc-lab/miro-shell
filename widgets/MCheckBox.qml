import QtQuick
import QtQuick.Controls

import qs.common

CheckBox {
    id: root

    text: "Text"

    signal check
    signal uncheck

    containmentMask: this.indicator

    indicator: MRectangle {
        id: outer
        implicitWidth: Settings.fontSize * 2 + 4
        implicitHeight: implicitWidth

        anchors.verticalCenter: parent.verticalCenter
        anchors.margins: Settings.itemMargin

        radius: 2
        color: Theme.colorOutline

        MRectangle {
            id: inner
            width: Settings.fontSize * 2 - 8
            height: width
            anchors.centerIn: outer
            radius: outer.radius

            color: Theme.colorPrimary
            visible: root.checked
        }

        MouseArea {
            anchors.fill: outer

            onClicked: () => {
                if (root.checked) {
                    root.uncheck();
                } else {
                    root.check();
                }
            }
        }
    }

    contentItem: MText {
        text: root.text

        horizontalAlignment: Text.AlignLeft
        verticalAlignment: Text.AlignVCenter
        leftPadding: root.indicator.width + root.spacing

        wrapMode: Text.Wrap
    }
}
