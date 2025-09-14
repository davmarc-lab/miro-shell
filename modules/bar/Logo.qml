import Quickshell.Widgets

import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root
    color: Theme.colorSurfaceVariant
    sizex: icon.implicitSize
    radius: 0

    MIcon {
        id: icon
        anchors.fill: parent

        implicitSize: Settings.barHeight

        name: "arch-logo.svg"
    }
}
