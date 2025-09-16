pragma Singleton

import Quickshell
import Quickshell.Io

import qs.common

Singleton {
    id: root

    readonly property bool wifi: false
    readonly property bool ethernet: false

    readonly property string netData: Settings.cacheDir + "network/"

    FileView {
        id: netFile
        path: ""

        blockLoading: true
        watchChanges: true

        onFileChanged: reload()
        onPathChanged: reload()
    }

    readonly property var detectedNet: netFile.loaded ? JSON.parse(netFile.text()) : null

    function getAvailableNetworks() {
        return detectedNet;
    }

    Process {
        id: getWifi
        running: false

        command: ["sh", "-c", Settings.scriptPath + "network/get-wifi.sh"]
        stdout: StdioCollector {
            onStreamFinished: {
                netFile.path = Settings.scriptPath + "network/wifi-networks.json";
                getWifi.running = false;
            }
        }
    }

    function scanWifi(): void {
        getWifi.running = true;
    }
}
