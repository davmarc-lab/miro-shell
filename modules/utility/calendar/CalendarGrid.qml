pragma ComponentBehavior: Bound

import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs
import qs.common
import qs.widgets

Item {
    id: root

    // current focused/clicked day in calendar
    property date dayFocus: undefined

    // calendar
    ColumnLayout {
        anchors.fill: parent

        // month - year row
        RowLayout {
            Layout.alignment: Qt.AlignCenter | Qt.AlignLeft
            MRButton {
                id: pre
                borderRadius: 4
                font.family: Icons.fontName
                text: Icons.get("backward")

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
                font.family: Icons.fontName
                text: Icons.get("forward")

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
                }

                color: base.model.date.getTime() == root.dayFocus.getTime() ? Theme.colorPrimary : Theme.colorSurfaceVariant
                border.color: model.today ? Theme.colorPrimary : this.color
            }

            onClicked: date => root.dayFocus = date

            Component.onCompleted: {
                root.dayFocus = new Date();
                root.dayFocus.setHours(0, 0, 0, 0);
            }
        }
    }
}
