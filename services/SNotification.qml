pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.Notifications

import QtQuick

import qs

Singleton {
    id: root
    property var notifications: []

    ListModel {
        id: popupsModel
    }

    readonly property ListModel popupsNotifications: popupsModel

    property bool enablePopups: Global.enableNotifPopups

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
            root.notifications.push(notif);

            if (root.enablePopups) {
                root.addPopup(notif);
            }
        }
    }

    function clearAll() {
        for (var notif of root.notifications) {
            notif.dismiss();
        }
        root.notifications = [];
        root.popupsNotifications.clear();
    }

    function addPopup(notification) {
        popupsModel.append({
            notification: notification
        });
    }

    function removePopup(notification) {
        for (let i = 0; i < popupsModel.count; i++) {
            if (popupsModel.get(i).notification === notification) {
                popupsModel.remove(i);
                break;
            }
        }
    }

    function init() {
    }
}
