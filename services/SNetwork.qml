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
        root.isInit = true;
    }

    function dump(): void {
        if (detectedNet.length != 0) {
            console.log(detectedNet.length);
            for (var elem of detectedNet) {
                console.log(elem.inUse + " - " + elem.network + " - " + elem.signal + " - " + elem.security + " - ");
            }
        }
    }

    FileView {
        id: netFile
        path: Settings.cacheDir + "network/wifi-networks.json"

        blockLoading: false
        watchChanges: true
        printErrors: true

        onFileChanged: reload()
        onPathChanged: reload()

        onLoaded: {
            if (this.text().length > 0) {
                root.detectedNet = JSON.parse(this.text());
            }
        }
        onLoadFailed: {
            console.log("failed -> " + this.path);
        }
    }

    property var detectedNet: []

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
                getWifi.running = false;
            }
        }
    }

    function scanWifi(): void {
        getWifi.running = true;
    }
}
