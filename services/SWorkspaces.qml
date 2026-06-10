pragma Singleton

import Quickshell
import Quickshell.Hyprland

import qs.common

Singleton {
    id: root

    property int active: Hyprland.focusedWorkspace.id
    property list<int> urgents: Hyprland.workspaces.values.filter(w => w.urgent).map(w => w.id)
    property list<int> availables: Array.from({
        length: Settings.workspaces.size
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
        if (index >= 1 && index <= Settings.workspaces.size) {
            this.active = index;
            Hyprland.dispatch(`hl.dsp.focus({workspace = ${this.active}})`);
        }
    }
}
