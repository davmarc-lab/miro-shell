pragma Singleton

import Quickshell
import Quickshell.Io

import qs.common

Singleton {
    id: root

    // modules loading
    property bool enableBar: true
    property bool enableRightPanel: false
    // property bool enableNotification: true
    // property bool enableSysTray: false

    property bool enableFoo: false
    property bool enableWallpaper: true

    property bool enableDock: false
    property bool enableSettings: false
    property bool enableWPSelector: false
    property bool enableUtility: true

    property bool enablePowerMenu: false

    // misc
    property bool enableBattery: false

    property bool enableWeather: true

    // shell
    property bool firstRun: false

    // If the file "first-run.txt" exists than it doesn't need to do anything
    // else it needs to initialize cache shell directories and files.
    FileView {
        id: hFirstRun

        path: Settings.cacheUserDir + "first-run.txt"
        printErrors: false

        onLoadFailed: error => {
            if (error == FileViewError.FileNotFound) {
                root.enableFirstRun();
                root.firstRun = true;
            }
        }

        onLoaded: {
            root.firstRun = false;
        }
    }

    function checkFirstRun(): bool {
        hFirstRun.reload();
    }

    // split these two
    function enableFirstRun(flag = true): void {
        if (flag) {
            Quickshell.execDetached(["bash", "-c", `touch ${hFirstRun.path}`]);
        } else {
            Quickshell.execDetached(["bash", "-c", `rm ${hFirstRun.path}`]);
            console.log(`${hFirstRun.path} removed`);
        }
    }
}
