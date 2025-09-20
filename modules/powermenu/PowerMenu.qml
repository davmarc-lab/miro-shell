import QtQuick.Layouts

import qs
import qs.common
import qs.widgets

MPopup {
    id: root

    open: Global.enablePowerMenu
    onOpenChanged: {
        Global.enablePowerMenu = root.open;
    }

    color: "#55000000"

    MRectangle {
        Layout.preferredWidth: root.screen.width * 0.5
        Layout.preferredHeight: root.screen.height * 0.5
        Layout.alignment: Qt.AlignCenter

        color: Theme.colorSurface

        PowerMenuContent {
            PowerMenuButton {
                command: "loginctl lock-session"
                keybind: Qt.Key_K
                text: "Lock"
                icon: "lock"
            }

            PowerMenuButton {
                command: "loginctl terminate-user $USER"
                keybind: Qt.Key_E
                text: "Logout"
                icon: "logout"
            }

            PowerMenuButton {
                command: "systemctl suspend"
                keybind: Qt.Key_U
                text: "Suspend"
                icon: "suspend"
            }

            PowerMenuButton {
                command: "systemctl hibernate"
                keybind: Qt.Key_H
                text: "Hibernate"
                icon: "hibernate"
            }

            PowerMenuButton {
                command: "systemctl poweroff"
                keybind: Qt.Key_K
                text: "Shutdown"
                icon: "poweroff"
            }

            PowerMenuButton {
                command: "systemctl reboot"
                keybind: Qt.Key_R
                text: "Reboot"
                icon: "reboot"
            }
        }
    }
}
