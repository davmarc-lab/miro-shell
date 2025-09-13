import Quickshell.Widgets

import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    color: Theme.colorSurfaceVariant
    sizex: icon.backer.sourceSize.height
    radius: 0

    MIcon {
        id: icon
        anchors.fill: parent

        name: "arch-logo.svg"
    }
}
