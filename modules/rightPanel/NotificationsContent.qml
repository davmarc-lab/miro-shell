import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

ColumnLayout {
    id: root

    Repeater {
        model: SNotification.notifications

        NotificationItem {
            required property var modelData

            notif: modelData

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: (screen.height - Settings.barHeight) * 0.05
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
