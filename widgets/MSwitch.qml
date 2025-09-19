import QtQuick
import QtQuick.Layouts

import qs.common

RowLayout {
    id: root

    required property string content

    property bool down: false
    required property bool checked

    function toggle() {
        this.checked = !this.checked;
    }

    MText {
        Layout.alignment: Qt.AlignLeft
        text: root.content
        color: Theme.colorOnSurface
        verticalAlignment: Text.AlignVCenter
    }

    signal onCheckedChanged

    Rectangle {
        id: bar
        Layout.alignment: Qt.AlignRight
        implicitWidth: 48
        implicitHeight: 26
        radius: 13
        color: root.checked ? Theme.colorPrimary : "#ffffff"
        border.color: root.checked ? Theme.colorPrimary : "#cccccc"

        Rectangle {
            x: root.checked ? parent.width - this.width : 0
            width: 26
            height: 26
            radius: 13
            color: root.down ? "#cccccc" : "#ffffff"
            border.color: root.checked ? Theme.colorSecondary : "#999999"
        }

        MouseArea {
            id: mouse
            anchors.fill: parent

            onClicked: event => {
                root.checked = !root.checked;
                root.onCheckedChanged();
            }

            onPressed: {
                root.down = true;
            }

            onReleased: {
                root.down = false;
            }
        }
    }
}
