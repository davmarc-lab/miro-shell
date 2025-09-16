pragma ComponentBehavior: Bound

import Quickshell.Hyprland

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

RowLayout {
    id: root

    Layout.fillWidth: true
    Layout.fillHeight: true

    Repeater {
        model: SWorkspaces.getAvailables()

        MRButton {
            Layout.preferredWidth: 30

            required property int modelData
            property int wId: modelData + 1
            property HyprlandWorkspace w: Hyprland.workspaces.values[modelData] ?? null

            text: wId
            fgColor: SWorkspaces.isFocused(wId) ? "lightblue" : Theme.colorOnPrimary
            bgColor: SWorkspaces.isUrgent(wId) ? Theme.colorError : Theme.colorPrimary

            onClicked: {
                SWorkspaces.activate(wId);
            }
        }
    }
}
