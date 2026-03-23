pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.Notifications

import QtQuick

import qs

Singleton {
    id: root
    property list<Notif> notifications: []

    ListModel {
        id: popupsModel
    }

    readonly property ListModel popupsNotifications: popupsModel

    property bool enablePopups: Global.enableNotifPopups

    property NotificationServer server: NotificationServer {
        id: notifServer

        bodySupported: true
        actionsSupported: true
        keepOnReload: true

        bodyMarkupSupported: false
        persistenceSupported: false

        onNotification: function (notif) {
            notif.tracked = true;
            const newNotif = notifComp.createObject(root, {
                notification: notif,
                popup: true
            });
            root.notifications.push(newNotif);

            if (root.enablePopups && newNotif.popup) {
                root.addPopup(newNotif);
            }
        }
    }

    function clearAll() {
        for (var notif of root.notifications) {
            notif.clear();
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

    component Notif: QtObject {
        id: wrapper

        required property Notification notification

        required property bool popup

        property string appName: notification.appName
        property string appIcon: notification.appIcon

        property string image: notification.image
        property string summary: notification.summary
        property string body: notification.body
        property string urgency: notification.urgency

        property bool tracked: notification.tracked

        // notification actions
        property list<var> actions: notification.actions ?? []

        function clear() {
            notification.dismiss();
        }
    }

    Component {
        id: notifComp

        Notif {}
    }
}
