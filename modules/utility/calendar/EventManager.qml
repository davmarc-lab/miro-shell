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

                    MFontIcon {
                        icon: "date"
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

                    MFontIcon {
                        icon: "time"
                    }

                    RowLayout {
                        id: eventTime
                        Layout.alignment: Qt.AlignHCenter
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

                MFontIcon {
                    Layout.fillWidth: true
                    icon: "timer"
                }

                MTextInput {
                    id: eventDuration
                    Layout.fillWidth: true
                    Layout.alignment: Qt.AlignHCenter
                    Layout.maximumWidth: parent.width / 2

                    placeholderText: "Event Duration"
                    text: "0"
                }

                MFontIcon {
                    Layout.fillWidth: true
                    icon: "event-description"
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

            font.family: Icons.fontName
            text: Icons.get("event-add")

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
