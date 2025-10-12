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
}
