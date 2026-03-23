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
        top: Settings.barHeight
        right: Settings.panelMargin
    }

    implicitWidth: Settings.notifPopupSize

    color: "transparent"

    property var notifications: SNotification.popupsNotifications

    // actual visible
    visible: notifications.count > 0

    ListView {
        id: notifList
        Layout.fillWidth: true
        Layout.fillHeight: true
        Layout.topMargin: Settings.panelMargin

        spacing: Settings.panelMargin
        model: root.notifications

        delegate: NotificationToast {
            required property var notification
            notif: notification

            width: ListView.view.width

            onDeadToast: SNotification.removePopup(notification)
        }
    }
}
