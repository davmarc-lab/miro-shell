pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property bool wifi: false
    readonly property bool ethernet: false

    readonly property string netData: Settings.cache.base + "network/"

    property list<var> detectedNet: []

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
        path: Settings.cache.base + "network/wifi-networks.json"

        blockLoading: false
        watchChanges: true
        printErrors: false

        onFileChanged: reload()

        onLoaded: {
            if (this.text().length > 0) {
                const parsed = JSON.parse(this.text());
                if (parsed) {
                    const ordered = parsed.sort((a, b) => b.signal - a.signal);
                    const uniq = new Set();
                    root.detectedNet = [];
                    ordered.forEach(o => {
                        if (!uniq.has(o.ssid) && o.ssid.length) {
                            uniq.add(o.ssid);
                            root.detectedNet.push(o);
                        }
                    });
                    // console.log("------DBG-------");
                    // networks.forEach(o => console.log(o.ssid + ", " + o.signal));
                    // console.log("------END-------");
                }
            }
        }

        onLoadFailed: {}
    }

    function getAvailableNetworks(): list<var> {
        if (this.isInit) {
            return detectedNet;
        }
        return [];
    }

    Process {
        id: getWifi
        running: false

        command: ["sh", "-c", Settings.dirs.scripts + "network/get-wifi.sh"]
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
