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
        top: true
        left: true
        bottom: true
    }

    ListView {
        model: SColorscheme.schemes

        Component.onCompleted: console.log(count)
    }

}
