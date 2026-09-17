import Quickshell
import Quickshell.Wayland

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

            implicitHeight: root.hovering ? Settings.bar.height : 10
            implicitWidth: workspaces.implicitWidth + (Settings.item.margin * 2)

            MRectangle {
                id: base
                anchors.fill: parent
                topLeftRadius: 0
                topRightRadius: topLeftRadius

                // visible: root.expanded


                Workspaces {
                    id: workspaces
                    anchors.centerIn: parent
                }
            }
        }
    }
}
