pragma Singleton

import Quickshell
import Quickshell.Hyprland

import qs.common

Singleton {
    id: root

    property int active: 0
    property list<int> urgents: Hyprland.workspaces.values.filter(w => w.urgent).map(w => w.id)
    property list<int> availables: Array.from({
        length: Settings.numWorkspaces
    }, (_, i) => i)

    function getAvailables(): list<int> {
        return this.availables;
    }

    function getActives(): list<int> {
        return Hyprland.workspaces.values.filter(w => w.toplevels != undefined).map(w => w.id);
    }

    function isFocused(index: int): bool {
        return Hyprland.focusedWorkspace != null && Hyprland.focusedWorkspace.id == index;
    }

    function isUrgent(index: int): bool {
        return urgents.includes(index);
    }

    function activate(index: int): void {
        if (index >= 1 && index <= Settings.numWorkspaces) {
            active = index;
            Hyprland.dispatch(`workspace ${index}`);
        }
    }
}
