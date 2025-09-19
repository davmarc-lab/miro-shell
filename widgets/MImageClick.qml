import Quickshell

import QtQuick

import qs.common

Rectangle {
    id: root
    required property int imgIdx
    required property string path

    property int sizex: Settings.thumbWidth
    property int sizey: Settings.thumbHeight
    property bool imageHovered: mouse.containsMouse

    width: sizex
    height: sizey

    signal imageClicked(int index)

    Image {
        id: img
        anchors.fill: parent

        source: root.path

        asynchronous: true

        MouseArea {
            id: mouse
            anchors.fill: parent
            hoverEnabled: true

            onClicked: root.imageClicked(root.imgIdx)
        }
    }
}

