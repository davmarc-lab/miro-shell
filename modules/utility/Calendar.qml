pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

import "./calendar"

UtilityPage {
    isFocused: eventManager.hasFocus()

    Item {
        id: root
        anchors.fill: parent
        anchors.margins: Settings.item.margin

        property var events: SCalendarEvents.getEvents()

        MRectangle {
            anchors.fill: parent

            color: Theme.colorSurface

            ColumnLayout {
                id: main
                anchors.fill: parent
                anchors.margins: Settings.item.margin

                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.bottomMargin: Settings.item.margin

                    CalendarGrid {
                        id: calendar
                        Layout.preferredWidth: main.width * 0.6
                        Layout.fillHeight: true

                        // dayFocus: events.current
                    }

                    // side event manager
                    EventManager {
                        id: eventManager
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        targetDay: calendar.dayFocus
                    }
                }

                MDivider {}

                // day event list
                EventList {
                    Layout.preferredHeight: parent.height * 0.4
                    Layout.fillWidth: true

                    current: calendar.dayFocus
                }
            }
        }
    }
}
