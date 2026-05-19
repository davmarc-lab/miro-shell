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

        implicitSize: Settings.bar.height

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
