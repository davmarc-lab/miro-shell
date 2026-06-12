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
    model: SWorkspaces.getAvailables()

    MRButton {
        visible: modelData >= 0

        Layout.preferredWidth: (Settings.bar.height - Settings.panel.margin) * (SWorkspaces.isFocused(modelData) ? 0.8 : 0.6)
            Layout.preferredHeight: this.width

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
