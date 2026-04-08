pragma ComponentBehavior: Bound
pragma Singleton

import Quickshell
import Quickshell.Io

import qs.common

Singleton {
    id: root

    readonly property string source: Settings.cache.docker + "data.json"
    property bool ready: false
    property string dockerData: ""

    function getData() {
        if (!this.ready) {
            this.scan();
            return undefined;
        }
        return JSON.parse(dockerData);
    }

    function scan() {
        scanProc.running = true;
    }

    Process {
        id: scanProc
        running: false
        command: ["sh", "-c", Settings.dirs.scripts + "docker/scan.sh"]
        stdout: StdioCollector {
            onStreamFinished: {
                root.ready = true;
                root.dockerData = this.text;
            }
        }
    }
}
