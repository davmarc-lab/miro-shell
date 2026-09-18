import Quickshell

import QtQuick

import qs.common
import qs.widgets
import qs.modules.bar

Scope {
    Variants {
        model: Quickshell.screens
        HidePanel {
            id: root
            isVertical: true
            anchors {
                right: true
            }

            decorationRight: true

            implicitHeight: Screen.height * 0.9
            implicitWidth: Settings.bar.width

            topRightRadius: 0
            bottomRightRadius: 0

            MRectangle {
                id: base
                anchors.fill: parent
                topLeftRadius: 0
                topRightRadius: topLeftRadius
                bottomLeftRadius: 0
            }
        }
    }
}
