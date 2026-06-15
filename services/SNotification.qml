pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.Notifications

import QtQuick

import qs

Singleton {
    id: root

    property alias notifications: notifServer.trackedNotifications

    property ListModel popups: ListModel {}

    property NotificationServer server: NotificationServer {
        id: notifServer

        bodySupported: true
        actionsSupported: true
        imageSupported: true
        keepOnReload: true

        bodyMarkupSupported: false
        persistenceSupported: false

        onNotification: function (notif) {
            notif.tracked = true;
            root.popups.append(notif);
        }
    }

    function hasPopups() {
        return root.popups.count > 0;
    }

    function clear(notification) {
        const notifs = root.notifications.values;
        for (let i = notifs.length - 1; i >= 0; i--) {
            if (notification == notifs[i]) {
                this.removePopup(notifs[i]);
                notifs[i].dismiss();
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
}
