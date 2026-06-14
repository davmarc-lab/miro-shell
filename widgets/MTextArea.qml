import QtQuick
import QtQuick.Controls

import qs.common

Item {
    id: root

    property string bgColor: Theme.colorSurface
    property string borderColor: Theme.colorOutline
    property bool isPassword: false

    property alias placeholderText: area.placeholderText
    property alias text: area.text

    signal escaped

    ScrollView {
        anchors.fill: parent

        ScrollBar.vertical.policy: area.contentHeight > area.height ? ScrollBar.AlwaysOn : ScrollBar.AlwaysOff;
        ScrollBar.horizontal.policy: ScrollBar.AlwaysOff

        TextArea {
            id: area

            width: parent.width
            height: parent.height

            color: Theme.colorOnSurface
            font.pointSize: Settings.font.size

            leftPadding: Settings.item.margin
            rightPadding: Settings.item.margin

            background: MRectangle {
                implicitWidth: parent.width
                implicitHeight: parent.height
                color: root.bgColor
                radius: Settings.item.radius / 2
                border.color: root.borderColor
            }

            wrapMode: Text.Wrap

            placeholderTextColor: Theme.colorOnSurface

            Keys.onEscapePressed: root.escaped()
        }
    }

    // lose input focus
    onEscaped: this.focus = false
}
