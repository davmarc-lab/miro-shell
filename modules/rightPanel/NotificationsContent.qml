import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

Item {
    id: root

    ColumnLayout {
        anchors.fill: parent

        ListView {
            Layout.fillWidth: true
            Layout.fillHeight: true
            clip: true
            spacing: Settings.itemMargin

            model: SNotification.notifications
            delegate: NotificationItem {
                required property var modelData

                notif: modelData
                width: ListView.view.width

                Layout.alignment: Qt.AlignTop
            }
        }

        MButton {
            id: clearBtn
            Layout.preferredHeight: this.implicitHeight

            text: "Clear"

            onClicked: {
                SNotification.clearAll();
            }
        }
    }
}
