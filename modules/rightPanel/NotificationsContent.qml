import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

Item {
    id: root

    ColumnLayout {
        anchors.fill: parent

        Repeater {
            model: SNotification.notifications

            delegate: NotificationItem {
                required property var modelData

                notif: modelData

                Layout.alignment: Qt.AlignTop
                Layout.fillWidth: true
            }
        }

        MFillLayout {}

        MButton {
            id: clearBtn

            text: "Clear"

            onClicked: {
                SNotification.clearAll();
            }
        }
    }
}
