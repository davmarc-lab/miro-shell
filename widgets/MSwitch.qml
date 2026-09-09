import QtQuick
import QtQuick.Controls

import qs.common

Switch {
    id: root

    implicitWidth: indicator.implicitWidth
    implicitHeight: indicator.implicitHeight

    property string bgDisabled: Theme.colorOutline
    property string bgEnabled: Theme.colorPrimary

    indicator: MRectangle {
        id: track

        implicitWidth: Settings.font.size * 2.5
        implicitHeight: Settings.font.size * 1.5

        anchors.fill: parent

        radius: height / 2
        color: root.checked ? root.bgEnabled : root.bgDisabled

        MRectangle {
            id: thumb

            width: track.implicitHeight - Settings.item.margin
            height: width
            anchors.verticalCenter: parent.verticalCenter

            x: root.checked ? track.width - width - Settings.item.margin / 2 : Settings.item.margin / 2

            radius: height / 2
            color: Theme.colorSecondary
        }
    }

    contentItem: null
}
