import Quickshell
import Quickshell.Networking

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

MPanelWindow {
    id: root
    visible: true

    anchors {
        // top: true
        left: true
        // bottom: true
    }

    implicitHeight: 400
    implicitWidth: 120

    color: "red"

    MComboBox {
        anchors.centerIn: parent
        width: parent.width * .8
        height: 40
    }
}
