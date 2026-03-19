import QtQuick

import qs.services
import qs.widgets

Item {
    id: root

    ListView {
        id: list
        anchors.fill: parent
        clip: true

        model: SAudio.applicationsNode

        delegate: MText {
            id: tt
            required property var modelData

            text: modelData.properties["application.name"]
        }
    }
}
