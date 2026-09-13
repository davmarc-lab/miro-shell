import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MRectangle {
    id: root
    color: Theme.colorSurface
    property bool expanded: false

    MText {
        id: colorscheme
        anchors {
            top: parent.top
            bottom: parent.bottom
            left: parent.left
            right: expand.left
            margins: Settings.item.margin
        }
        text: "Sample"
    }

    Item {
        id: expand
        width: parent.height
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            margins: Settings.item.margin / 2
        }

        RowLayout {
            anchors.fill: parent
            MDivider {
                vertical: true
            }

            MFontIcon {
                Layout.fillHeight: true
                Layout.preferredWidth: height
                color: Theme.colorOnSurface

                icon: root.expanded ? "expanded" : "expand"

                MouseArea {
                    id: mouse
                    anchors.fill: parent
                    onClicked: root.expanded = !root.expanded
                }
            }
        }
    }
}
