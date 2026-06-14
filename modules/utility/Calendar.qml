pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs
import qs.common
import qs.services
import qs.widgets

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

                Item {
                    Layout.preferredWidth: main.width * 0.6
                    Layout.fillHeight: true

                    // calendar
                    ColumnLayout {
                        anchors.fill: parent

                        // month - year row
                        RowLayout {
                            Layout.alignment: Qt.AlignCenter | Qt.AlignLeft
                            MRButton {
                                id: pre
                                borderRadius: 4
                                text: "<"

                                onClicked: {
                                    if (grid.month === 0)
                                        grid.year--;
                                    grid.month = (grid.month + 11) % 12;
                                }
                            }

                            MFillLayout {}

                            MTitle {
                                id: month
                                Layout.alignment: Qt.AlignHCenter
                                text: Helper.capitalizeString(Qt.locale().standaloneMonthName(grid.month)) + " - " + grid.year
                                subtitle: true
                                font.weight: Font.Bold
                            }

                            MFillLayout {}

                            MRButton {
                                id: next
                                borderRadius: 4
                                text: ">"

                                onClicked: {
                                    if (grid.month === 11)
                                        grid.year++;
                                    grid.month = (grid.month + 1) % 12;
                                }
                            }
                        }

                        // day row
                        DayOfWeekRow {
                            id: days
                            Layout.fillWidth: true
                            locale: grid.locale

                            delegate: MText {
                                required property string shortName

                                horizontalAlignment: Text.AlignHCenter
                                verticalAlignment: Text.AlignVCenter

                                font.weight: Font.DemiBold
                                text: Helper.capitalizeString(shortName)
                            }
                        }

                        // month days grid
                        MonthGrid {
                            id: grid
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            delegate: MRectangle {
                                id: base
                                required property var model

                                MText {
                                    anchors.fill: parent

                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    opacity: base.model.month === grid.month ? 1 : 0.4

                                    text: grid.locale.toString(base.model.date, "d")
                                    // color: base.model.today ? Theme.colorOnPrimary : Theme.colorOnSurfaceVariant
                                }

                                color: base.model.date.getTime() == events.current.getTime() ? Theme.colorPrimary : Theme.colorSurfaceVariant
                                border.color: model.today ? Theme.colorPrimary : this.color
                            }

                            onClicked: date => {
                                events.current = date;
                            // const today = new Date();
                            // today.setHours(0, 0, 0, 0);
                            // SCalendarEvents.addEvent("Other event with long desc\nNew lines too", today, 0)
                            }

                            Component.onCompleted: {
                                const today = new Date();
                                today.setHours(0, 0, 0, 0);
                                events.current = today;
                            }
                        }
                    }
                }

                // side event manager
                Item {
                    id: eventManager
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    ColumnLayout {
                        anchors.fill: parent

                        Item {
                            id: eventFactory
                            Layout.fillWidth: true
                            Layout.preferredHeight: parent.height * 0.85

                            ColumnLayout {
                                anchors.fill: parent

                                spacing: Settings.item.margin

                                MText {
                                    Layout.fillWidth: true
                                    text: "Day"
                                }

                                MText {
                                    id: eventDay
                                    Layout.fillWidth: true

                                    text: Qt.formatDate(events.current, "dd/MM/yy")
                                }

                                MText {
                                    Layout.fillWidth: true
                                    text: "Duration"
                                }

                                MTextInput {
                                    id: eventDuration
                                    Layout.fillWidth: true
                                    Layout.maximumWidth: parent.width

                                    placeholderText: "Event Duration"
                                    text: "0"
                                }

                                MText {
                                    Layout.fillWidth: true
                                    text: "Description"
                                }

                                MTextArea {
                                    id: eventDesc
                                    Layout.fillHeight: true
                                    Layout.fillWidth: true

                                    placeholderText: "Event Description"
                                }
                            }
                        }

                        MButton {
                            Layout.fillWidth: true
                            Layout.fillHeight: true

                            text: "Add Event"

                            onClicked: {
                                const day = new Date(events.current);
                                const duration = eventDuration.text;
                                const desc = eventDesc.text;

                                if (!duration || !desc)
                                    return;

                                SCalendarEvents.addEvent(desc, day, duration);

                                eventDuration.text = "0";
                                eventDesc.text = "";
                            }
                        }
                    }
                }
            }

            MDivider {}

            // day event list
            Item {
                id: events

                property date current: new Date()

                Layout.preferredHeight: parent.height * 0.4
                Layout.fillWidth: true

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

                        model: SCalendarEvents.getEventsByDate(events.current)

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
        }
    }
}
