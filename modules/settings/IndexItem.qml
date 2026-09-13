import QtQuick
import qs.widgets
import qs.common

MRectangle {
    id: root

    required property string entry
    property string iconName: "expand"
    property bool iconFill: true
    property bool open: false

    readonly property int expandArea: (layoutRow.implicitHeight + Settings.item.margin * 2) / 2

    signal clicked

    implicitWidth: layoutRow.implicitWidth + Settings.item.margin * 4
    implicitHeight: layoutRow.implicitHeight + Settings.item.margin * 2 + (open ? expandArea : 0)

    color: {
        if (mouse.pressed)
            return (Theme.isDark ? Qt.lighter(Theme.colorSurfaceVariant, 1.2) : Qt.darker(Theme.colorSurfaceVariant, 1.2));
        if (mouse.containsMouse)
            return Theme.colorSurfaceVariant;
        return Theme.colorSurface;
    }
    border.color: this.open || mouse.pressed ? Theme.colorPrimary : Theme.colorOutline

    MouseArea {
        id: mouse
        anchors.fill: parent
        hoverEnabled: true
        onClicked: root.clicked()
    }

    Behavior on implicitHeight {
        NumberAnimation {
            duration: 150
            easing.type: Easing.Linear
        }
    }

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
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignLeft

            text: root.entry
            color: Theme.colorOnSurface
        }
    }
}
