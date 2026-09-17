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
            anchors {
                top: true
                bottom: false
                left: true
                right: false
            }

            implicitHeight: Settings.bar.height
            implicitWidth: workspaces.implicitWidth + Settings.item.margin * 2

            topLeftRadius: 0
            topRightRadius: 0
            bottomLeftRadius: 0

            MRectangle {
                id: base
                anchors.fill: parent
                topLeftRadius: 0
                topRightRadius: topLeftRadius

                Workspaces {
                    id: workspaces
                    anchors.centerIn: parent
                }
            }
        }
    }
}
