pragma Singleton

import Quickshell

import qs.common

Singleton {
    id: root

    function checkDir(dir: string): bool {
    }

    function prepareCache(): void {
        Quickshell.execDetached(["sh", "-c", `${Settings.scriptPath}/init.sh`]);
    }

    function getDesktopEntryByName(name: string): DesktopEntry {
        return DesktopEntries.byId(name) ?? DesktopEntries.applications.values.find(e => e.name.toLowerCase() === name.toLowerCase() || e.id.toLowerCase().startsWith(name.toLowerCase()));
    }
}
