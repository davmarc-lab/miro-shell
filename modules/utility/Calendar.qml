pragma ComponentBehavior: Bound
import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

import qs
import qs.common
import qs.widgets

Item {
    id: root
    anchors.fill: parent
    anchors.margins: Settings.itemMargin

    MRectangle {
        anchors.fill: parent

        color: Theme.colorSurface

        ColumnLayout {
            anchors.fill: parent
            anchors.margins: Settings.itemMargin

            MTitle {
                id: month
                Layout.alignment: Qt.AlignCenter
                text: Helper.capitalizeString(Qt.locale().standaloneMonthName(grid.month))
                subtitle: true
                font.weight: Font.Bold
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
    }
}
