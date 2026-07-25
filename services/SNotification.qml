pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io
import Quickshell.Services.Notifications

import QtQuick

import qs

Singleton {
    id: root

    property alias notifications: server.trackedNotifications

    property ListModel popups: ListModel {}

    property NotificationServer server: NotificationServer {
        id: server

        bodySupported: true
        actionsSupported: true
        imageSupported: true
        keepOnReload: true

        bodyMarkupSupported: false
        persistenceSupported: false

        onNotification: function (notif) {
            notif.tracked = true;
            if (Global.enableNotifPopups)
                root.popups.append(notif);
        }
    }

    function hasPopups() {
        return root.popups.count > 0;
    }

    function clearPopups() {
        root.popups.clear();
    }

    function clear(notification) {
        const notifs = root.notifications.values;
        for (let i = notifs.length - 1; i >= 0; i--) {
            if (notification.id == notifs[i].id) {
                this.removePopup(notifs[i]);
                notifs[i].dismiss();
                return;
            }
        }
    }

    function clearAll() {
        const notifs = root.notifications.values;
        for (let i = notifs.length - 1; i >= 0; i--) {
            this.removePopup(notifs[i]);
            notifs[i].dismiss();
        }
    }

    function removePopup(notif) {
        for (let i = root.popups.count - 1; i >= 0; i--) {
            if (root.popups.get(i).id === notif.id) {
                root.popups.remove(i, 1);
                break;
            }
        }
    }

    function init() {
    }

    IpcHandler {
        target: "notification"

        function togglePopups(): void {
            Global.enableNotifPopups = !Global.enableNotifPopups;
        }

        function isPopupsEnabled(): bool {
            return Global.enableNotifPopups;
        }
    }
}
