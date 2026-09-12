import QtQuick
import qs.widgets
import qs.common

MButton {
    id: root

    required property string entry
    property string iconName: "expand"
    property bool iconFill: true
    property bool open: false

    text: entry

    implicitWidth: contentItem.implicitWidth + Settings.item.margin * 4
    implicitHeight: contentItem.implicitHeight + Settings.item.margin * 2

    bgColor: Theme.colorSurface
    bgColorHovered: Theme.colorSurfaceVariant
    colorClicked: Qt.lighter(Theme.colorSurfaceVariant, 1.2)
    outlineColor: open ? Theme.colorPrimary : Theme.colorOutline

    contentItem: Item {
        implicitWidth: layoutRow.implicitWidth
        implicitHeight: layoutRow.implicitHeight

        Row {
            id: layoutRow
            anchors.left: parent.left
            anchors.verticalCenter: parent.verticalCenter
            anchors.margins: Settings.item.margin
            spacing: Settings.item.margin

            Item {
                id: iconContainer
                width: fontIcon.iconSize
                height: fontIcon.height

                anchors.verticalCenter: parent.verticalCenter

                visible: root.iconName !== ""

                MFontIcon {
                    id: fontIcon
                    anchors.centerIn: parent

                    icon: root.iconName
                    iconFilled: root.iconFill
                    color: Theme.colorOnSurface
                }
            }

            MText {
                id: labelText
                text: root.text
                color: Theme.colorOnSurface
                anchors.verticalCenter: parent.verticalCenter
                horizontalAlignment: Text.AlignLeft
            }
        }
    }
}
