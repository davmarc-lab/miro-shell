import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MWrapRectangle {
    id: root

    property string eventDate
    property string desc: "foo"
    readonly property date parsedDate: new Date(eventDate)

    color: Theme.colorPrimary

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
            text: root.desc

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
                    anchors.margins: Settings.item.margin
                    MThemeIcon {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        // implicitSize: parent.height
                        name: "play"
                    }

                    MDivider {
                        vertical: true
                    }

                    MThemeIcon {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        // implicitSize: parent.height
                        name: "pause"
                    }
                }
            }
        }

        // MFillLayout {}
    }
}
