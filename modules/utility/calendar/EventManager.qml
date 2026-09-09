import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

Item {
    id: root

    property date targetDay: undefined

    function hasFocus(): bool {
        return hh.focus || mm.focus || eventDuration.focus || eventDesc.areaFocus;
    }

    ColumnLayout {
        anchors.fill: parent

        Item {
            id: eventFactory
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.85

            ColumnLayout {
                anchors.fill: parent

                spacing: Settings.item.margin

                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MText {
                        Layout.fillWidth: true
                        text: "Day"
                    }

                    MText {
                        id: eventDay
                        Layout.fillWidth: true

                        text: Qt.formatDate(root.targetDay, "dd/MM/yy")
                    }
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true

                    MText {
                        Layout.fillWidth: true
                        text: "Time"
                    }

                    RowLayout {
                        id: eventTime
                        Layout.fillWidth: true
                        Layout.fillHeight: true

                        MFillLayout {
                            dy: false
                        }

                        MTextInput {
                            id: hh
                            Layout.fillWidth: true
                            placeholderText: "HH"
                            text: "00"
                            inputMethodHints: Qt.ImhDigitsOnly
                        }

                        MText {
                            text: ":"
                        }

                        MTextInput {
                            id: mm
                            Layout.fillWidth: true
                            placeholderText: "mm"
                            text: "00"
                            inputMethodHints: Qt.ImhDigitsOnly
                        }

                        MFillLayout {
                            dy: false
                        }
                    }
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
                const day = new Date(root.targetDay);
                const duration = eventDuration.text;
                const desc = eventDesc.text;

                if (!duration || !desc)
                    return;

                if (!hh.acceptableInput || !mm.acceptableInput)
                    return;

                const hour = Number(hh.text);
                const minutes = Number(mm.text);

                if ((hour >= 24 || hour < 0) || (minutes >= 60 || minutes < 0)) {
                    console.warn("EVENTS - Create -- Send Notification");
                    return;
                }
                day.setHours(hour);
                day.setMinutes(minutes);
                SCalendarEvents.addEvent(desc, day, duration);

                eventDuration.text = "0";
                eventDesc.text = "";

                hh.text = "00";
                mm.text = "00";
            }
        }
    }
}
