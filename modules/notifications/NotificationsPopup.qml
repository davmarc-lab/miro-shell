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

    property var notifications: SNotification.popupsNotifications

    // actual visible
    visible: notifications.count > 0

    ListView {
        id: notifList
        Layout.fillWidth: true
        Layout.fillHeight: true

        spacing: Settings.panel.margin / 2
        model: root.notifications

        delegate: NotificationToast {
            required property var notification
            notif: notification

            width: ListView.view.width

            onDeadToast: SNotification.removePopup(notification)
        }
    }
}
