pragma ComponentBehavior: Bound

import Quickshell.Widgets

import QtQuick
import Qt5Compat.GraphicalEffects

import qs.common

Image {
    id: root
    required property string name
    property string dir: Settings.iconsPath + Theme.themeStyle + "/"

    source: Qt.resolvedUrl(this.dir + this.name)

    fillMode: Image.PreserveAspectCrop

    layer.enabled: true
    layer.effect: OpacityMask {
        maskSource: Item {
            width: root.width
            height: width

            Rectangle {
                anchors.centerIn: parent
                width: parent.width
                height: width
                radius: width
            }
        }
    }
}
