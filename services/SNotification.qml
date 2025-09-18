pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Services.Notifications

import QtQuick

Singleton {
    id: root
    property list<Notif> notifications: []

    property NotificationServer server: NotificationServer {
        id: notifServer

        bodySupported: true
        actionsSupported: true
        keepOnReload: true

        bodyMarkupSupported: false
        persistenceSupported: false

        onNotification: function (notif) {
            notif.tracked = true;
            root.notifications.push(notifComp.createObject(root, {
                notification: notif,
                popup: true
            }));
        }
    }

    function clearAll() {
        root.notifications = [];
        for (var notif of root.notifications) {
            notif.clear();
        }
    }

    component Notif: QtObject {
        id: wrapper

        required property Notification notification

        required property bool popup

        property string appName: notification.appName ?? ""
        property string appIcon: notification.appIcon ?? ""

        property string image: notification.image
        property string summary: notification.summary ?? ""
        property string body: notification.body ?? ""
        property string urgency: notification.urgency ?? ""

        property bool tracked: notification.tracked ?? false

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
