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
        id: item
        model: SWorkspaces.getActives()

        MRButton {
            visible: modelData >= 0

            Layout.preferredWidth: Settings.bar.width - Settings.panel.margin * 1.3
            Layout.preferredHeight: Settings.bar.height - Settings.panel.margin * 1.3

            required property int modelData
            property HyprlandWorkspace w: Hyprland.workspaces.values[modelData] ?? null

            text: ""
            bgColor: SWorkspaces.isFocused(modelData) ? Theme.colorPrimary : Theme.colorSecondary

            onClicked: {
                SWorkspaces.activate(modelData);
            }
        }
    }
}
