import QtQuick

import qs.services
import qs.widgets

Item {
    id: root

    ListView {
        id: list
        anchors.fill: parent
        clip: true

        model: SAudio.getApplicationsNode()

        delegate: MText {
            required property var modelData

            text: modelData.name
        }
    }
}
