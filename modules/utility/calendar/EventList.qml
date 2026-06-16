import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

Item {
    id: root

    required property date current

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.item.margin

        MTitle {
            Layout.alignment: Qt.AlignTop
            text: "Events"
        }

        // all event cards
        ListView {
            id: eventCards
            Layout.fillWidth: true
            Layout.fillHeight: true

            orientation: ListView.Horizontal
            clip: true
            spacing: 5

            model: SCalendarEvents.getEventsByDate(root.current)

            delegate: EventCard {
                height: parent.height
                width: this.height

                required property var modelData
                eventDate: modelData.eventDate
                desc: modelData.description
            }
        }
    }
}
