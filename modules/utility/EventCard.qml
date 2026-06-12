import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

MWrapRectangle {
    id: root

    property string title
    property string desc: "foo"

    color: Theme.colorPrimary

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.item.margin

        MTitle {
            id: tDay
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignTop

            text: root.title
            subtitle: true
        }

        MText {
            id: tDesc
            Layout.fillWidth: true
            Layout.fillHeight: true
            text: "very very long desc wtf\nasdhgajhg sahgd hgd sgd gd agd jagd ja"
            wrapMode: Text.Wrap

            Layout.alignment: Qt.AlignTop
        }

        MFillLayout {}
    }
}
