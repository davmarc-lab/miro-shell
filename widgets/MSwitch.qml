import QtQuick
import QtQuick.Controls

import qs.common

Switch {
    id: root

    signal enable
    signal disable

    implicitWidth: indicator.implicitWidth
    implicitHeight: indicator.implicitHeight

    indicator: MRectangle {
        id: track

        implicitWidth: Settings.font.size * 4
        implicitHeight: Settings.font.size * 2 + 4

        anchors.fill: parent

        radius: height / 2
        color: root.checked ? Theme.colorPrimary : Theme.colorOutline

        MRectangle {
            id: thumb

            width: Settings.font.size * 2 - 4
            height: width
            anchors.verticalCenter: parent.verticalCenter

            x: root.checked ? track.width - width - 2 : 2

            radius: height / 2
            color: Theme.colorSecondary
        }

        // MouseArea {
        //     anchors.fill: parent
        //     onClicked: {
        //         if (root.checked) {
        //             root.disable();
        //         } else {
        //             root.enable();
        //         }
        //         root.toggle();
        //     }
        // }
    }

    contentItem: null
}
