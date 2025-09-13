import QtQuick
import QtQuick.Layouts

import qs.common

Rectangle {
    property int sizex: 0
    property int sizey: 0

    property bool layout: true

    radius: Settings.itemRadius
    // border.color: Theme.colorOnSurface

    implicitWidth: {
        if (layout) {
            if (sizex <= 0) {
                Layout.fillWidth = true;
                return width;
            }
            Layout.preferredWidth = sizex;
            return sizex;
        }
        return sizex == 0 ? parent.width : sizex;
    }

    implicitHeight: {
        if (layout) {
            if (sizey <= 0) {
                Layout.fillHeight = true;
                return height;
            }
            Layout.preferredHeight = sizey;
            return sizey;
        }
        return sizey == 0 ? parent.height : sizey;
    }

    color: Theme.colorSurfaceVariant
}
