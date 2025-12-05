import Quickshell.Widgets

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

    MIconClick {
        id: icon
        anchors.fill: parent

        implicitSize: Settings.barHeight

        name: "arch-logo.svg"

        onIconClick: {
            Global.enableUtility = true;
        }
    }
}
