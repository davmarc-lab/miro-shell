import Quickshell
import Quickshell.Widgets

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

MRectangle {
    id: root
    required property var node

    height: layout.height + 2 * Settings.item.margin
    color: Theme.colorSurface

    RowLayout {
        id: layout
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.left: parent.left
        anchors.margins: Settings.item.margin

        MIcon {
            property DesktopEntry entry: Helper.getDesktopEntryByName(root.node.name)
            implicitSize: Settings.rightPanel.iconSize
            name: "image://icon/" + (entry?.icon ?? "audio-x-generic")
        }

        MText {
            text: root.node.properties["application.name"] || root.node.properties["media.name"] || root.node.description || root.node.name
        }

        MText {
            id: nodeVol
            text: Math.round(volSlider.value * 100)
        }

        MSlider {
            id: volSlider
            Layout.fillWidth: true
            value: root.node.audio.volume
            to: 1
            onMoved: {
                root.node.audio.volume = value;
            }
        }

        MThemeIconClick {
            id: volIcon
            property string streamState: root.node.audio.muted ? "null" : this.val == 0 ? "mute" : this.val < 33 ? "low" : this.val < 66 ? "medium" : "high"
            property alias val: nodeVol.text

            name: "volume-" + streamState
            implicitSize: 28

            onIconClick: {
                root.node.audio.muted = !root.node.audio.muted;
            }
        }
    }
}
