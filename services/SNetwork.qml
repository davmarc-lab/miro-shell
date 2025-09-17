pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property bool wifi: false
    readonly property bool ethernet: false

    readonly property string netData: Settings.cacheDir + "network/"

    property bool isInit: false

    function init(): void {
        root.scanWifi();
        console.log("SIU");
        // detectedNet = JSON.parse(netFile.text());
        console.log("SIU");
        root.isInit = true;
    }

    FileView {
        id: netFile
        path: "scripts/network/wifi-networks.json"

        blockLoading: true
        watchChanges: true

        onFileChanged: reload()
        onPathChanged: reload()
    }

    property list<JsonObject> detectedNet: []

    function getAvailableNetworks(): list<JsonObject> {
        if (this.init)
            return detectedNet;
        return [];
    }

    Process {
        id: getWifi
        running: false

        command: ["sh", "-c", Settings.scriptPath + "network/get-wifi.sh"]
        stdout: StdioCollector {
            onStreamFinished: {
                console.log(this.text);
                console.log("END");
                getWifi.running = false;
            }
        }
    }

    function scanWifi(): void {
        console.log("CALLED");
        getWifi.running = true;
    }
}
