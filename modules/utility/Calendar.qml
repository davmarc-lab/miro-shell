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
            anchors.fill: parent
            anchors.margins: Settings.item.margin

            RowLayout {
                Layout.alignment: Qt.AlignCenter
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
                    Layout.alignment: Qt.AlignCenter
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

            DayOfWeekRow {
                id: days
                Layout.fillWidth: true
                // Layout.maximumWidth: parent.width * 0.6
                locale: grid.locale

                delegate: MText {
                    required property string shortName

                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter

                    font.weight: Font.DemiBold
                    text: Helper.capitalizeString(shortName)
                }
            }

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

            MDivider {}

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

                    RowLayout {
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        MButton {
                            Layout.preferredWidth: this.height
                            Layout.preferredHeight: parent.height / 2

                            text: "+"
                            bgColor: Theme.colorSurfaceVariant
                            bgColorHovered: Qt.darker(Theme.colorSurfaceVariant, 1.2)
                            fgColor: Theme.colorOnSurfaceVariant
                            fgColorHovered: Theme.colorOnSurfaceVariant
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

        function addEvent(desc: string, calModel: var, hour: int, minute: int, duration: int) {
            const eventDate = new Date(calModel.year, calModel.month, calModel.day);
            SCalendarEvents.addEvent(desc, calModel, hour, minute, duration);
        }
    }
}
