pragma ComponentBehavior: Bound

import Quickshell.Hyprland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    id: root

    Repeater {
        model: SWorkspaces.getActives()

        MRButton {
            Layout.preferredWidth: Settings.bar.width - Settings.panel.margin * 1.3
            Layout.preferredHeight: Settings.bar.height - Settings.panel.margin * 1.3

            required property int modelData
            property HyprlandWorkspace w: Hyprland.workspaces.values[modelData] ?? null

            text: ""
            fgColor: SWorkspaces.isFocused(modelData) ? "lightblue" : Theme.colorOnPrimary
            // bgColor: SWorkspaces.isUrgent(modelData) ? Theme.colorError : Theme.colorPrimary

            onClicked: {
                SWorkspaces.activate(modelData);
            }
        }
    }
}
