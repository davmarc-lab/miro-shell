import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

import qs

MRectangle {
    id: root
    Layout.preferredWidth: icon.implicitSize
    Layout.fillHeight: true

    color: Theme.colorSurfaceVariant
    radius: 0

    MThemeIcon {
        id: icon
        anchors.fill: parent
        anchors.margins: Settings.itemMargin / 2

        implicitSize: Settings.barHeight

        name: "arch-logo"
    }

    MouseArea {
        id: mouse
        anchors.fill: parent

        onClicked: {
            Global.enableUtility = true;
        }
    }
}
