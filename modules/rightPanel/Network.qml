import QtQuick
import QtQuick.Layouts

import qs
import qs.common
import qs.services
import qs.widgets

MRectangle {
    color: Theme.colorSurface

    MText {
        anchors.centerIn: parent
        visible: SNetwork.getAvailableNetworks().length == 0
        text: "No Networks Available"
    }

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.item.margin

        RowLayout {
            Layout.fillWidth: true
            MTitle {
                text: "Enable"
            }

            MFillLayout {
                dy: false
            }

            MSwitch {
                Layout.alignment: Qt.AlignRight
                checked: SNetwork.enableWifi
                onClicked: SNetwork.toggleWifi()
            }
        }

        ListView {
            id: listView

            Layout.fillWidth: true
            Layout.fillHeight: true

            model: SNetwork.getAvailableNetworks()
            spacing: Settings.panel.margin
            clip: true

            delegate: WifiItem {
                id: delegate
                required property var modelData
                wifi: modelData
            }
        }
    }
}
