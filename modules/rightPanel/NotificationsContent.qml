import QtQuick
import QtQuick.Layouts

import qs.widgets
import qs.services

ColumnLayout {
    id: root

    Repeater {
        model: SNotification.notifications

        MText {
            required property var modelData

            Layout.alignment: Qt.AlignTop
            Layout.fillWidth: true
            Layout.fillHeight: true

            text: modelData.summary
        }
    }
}
