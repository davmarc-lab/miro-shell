import Quickshell
import Quickshell.Wayland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

MPopupPane {
    id: root

    anchors {
        top: true
        bottom: true
        right: true
        left: false
    }

    margins {
        top: Settings.bar.size
        right: Settings.panel.margin
    }

    WlrLayershell.keyboardFocus: WlrKeyboardFocus.None

    implicitWidth: Settings.notification.popup.size

    color: "transparent"

    // actual visible
    visible: SNotification.hasPopups()

    mask: Region {
        x: notifList.x
        y: notifList.y
        width: notifList.width
        height: notifList.contentHeight
    }

    ListView {
        id: notifList
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.alignment: Qt.AlignTop

        spacing: Settings.panel.margin / 2
        model: SNotification.popups

        clip: false

        delegate: NotificationToast {
            required property var modelData
            notif: modelData

            width: ListView.view.width

            onDeadToast: {
                SNotification.removePopup(modelData);
            }
        }
    }
}
