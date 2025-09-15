import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

FloatingWindow {
    // anchors {
    //     top: true
    //     left: true
    // bottom: true
    // }
    // exclusiveZone: 0

    implicitWidth: 400
    implicitHeight: 300

    color: Theme.colorSurface

    Rectangle {
        id: leftPanel
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: center.left

        width: 200
        height: 300
        color: "red"
    }

    Rectangle {
        id: center
        anchors.top: parent.top
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom

        width: 200
        height: 300
        color: "green"
    }

    Rectangle {
        id: rightPanel
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.left: center.right
        anchors.right: parent.right

        width: 200
        height: 300
        color: "blue"
    }
}
