import QtQuick
import QtQuick.Layouts

import Quickshell

import qs.widgets
import qs.services
import qs.common

MPanelWindow {
    id: root
    visible: true

    anchors {
        top: true
        right: true
    }

    margins {
        right: 10
    }

    implicitWidth: 400
    implicitHeight: 400
    color: Theme.colorSurface

    Loader {
        id: content
        anchors.fill: parent
        source: "./modules/utility/Mixer.qml"
    }
}
