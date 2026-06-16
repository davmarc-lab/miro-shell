import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

MWrapRectangle {
    id: root
    required property var event

    readonly property date parsedDate: new Date(event.eventDate)

    color: event.completed ? Theme.colorSecondary : Theme.colorPrimary

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.item.margin

        spacing: 0

        // time
        MText {
            id: tDay
            Layout.fillWidth: true
            Layout.preferredHeight: this.contentHeight
            Layout.alignment: Qt.AlignTop
            clip: true

            text: root.parsedDate.getHours() + ":" + root.parsedDate.getMinutes()
            font.bold: true

            color: Theme.colorOnPrimary
        }

        MText {
            id: tDesc
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            text: root.event.description

            elide: Text.ElideRight
            wrapMode: Text.Wrap

            color: Theme.colorOnPrimary
        }

        Item {
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.2

            MRectangle {
                anchors.fill: parent

                RowLayout {
                    anchors.fill: parent
                    anchors.margins: Settings.item.margin / 2
                    MThemeIconClick {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        name: "delete"

                        onIconClick: {
                            console.warn("EVENTS - Delete -- Send Notification");
                            SCalendarEvents.removeEvent(root.event);
                        }
                    }

                    MDivider {
                        vertical: true
                        visible: !root.event.completed
                    }

                    MThemeIconClick {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        name: "confirm"

                        visible: !root.event.completed

                        onIconClick: {
                            console.warn("EVENTS - Complete -- Send Notification");
                            SCalendarEvents.completeEvent(root.event);
                        }
                    }
                }
            }
        }

        // MFillLayout {}
    }
}
