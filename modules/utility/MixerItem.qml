import Quickshell

import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.services
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

        MFontIcon {
            // remove the layout marings
            id: volIcon
            leftPadding: -Settings.item.margin / 2
            icon: SAudio.getAudioLevelIcon(volSlider.value)

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.node.audio.muted = !root.node.audio.muted;
                    volIcon.icon = root.node.audio.muted ? "\ue710" : SAudio.getAudioLevelIcon(volSlider.value);
                }
            }
        }
    }
}
