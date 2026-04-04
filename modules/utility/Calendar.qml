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
    anchors.margins: Settings.itemMargin

    property var events: SCalendarEvents.getEvents()

    MRectangle {
        anchors.fill: parent

        color: Theme.colorSurface

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Settings.itemMargin

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
                        color: base.model.today ? Theme.colorOnPrimary : Theme.colorOnSurfaceVariant
                    }

                    color: model.today ? Theme.colorPrimary : Theme.colorSurfaceVariant
                }
            }
        }

        function addEvent(desc: string, calModel: var, hour: int, minute: int, duration: int) {
            const eventDate = new Date(calModel.year, calModel.month, calModel.day);
            SCalendarEvents.addEvent(desc, calModel, hour, minute, duration);
        }
    }
}
