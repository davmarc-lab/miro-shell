import QtQuick
import QtQuick.Layouts

import qs.widgets
import qs.common

MPanelWindow {
    id: root
    visible: true

    anchors {
        top: true
        bottom: true
        left: true
    }

    margins {
        bottom: 10
    }

    color: Theme.colorSurfaceVariant

    RowLayout {
        width: 300
        height: 100
        anchors.centerIn: parent
        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: "red"

            MThemeIcon {
                anchors.fill: parent
                name: "keyboard"
            }
        }
    }
}
