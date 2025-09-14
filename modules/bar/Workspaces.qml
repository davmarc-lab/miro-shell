pragma ComponentBehavior: Bound

import Quickshell.Hyprland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets

RowLayout {
    id: root

    Layout.fillWidth: true
    Layout.fillHeight: true

    Repeater {
        model: Hyprland.workspaces.values.filter(w => w.id >= 0);

        MRButton {
            Layout.preferredWidth: 70
            Layout.fillHeight: true

            required property HyprlandWorkspace modelData
            text: modelData.id
            fgColor: modelData.active ? "lightblue" : Theme.colorOnPrimary
            bgColor: modelData.urgent ? Theme.colorError : Theme.colorPrimary

            onClicked: {
                modelData.activate();
            }
        }
    }
}
