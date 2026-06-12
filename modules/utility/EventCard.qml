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
        }

        MText {
            id: tDesc
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop
            text: root.desc

            elide: Text.ElideRight
            wrapMode: Text.Wrap
        }

        // MFillLayout {}
    }
}
