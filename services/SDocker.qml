pragma ComponentBehavior: Bound
pragma Singleton

import Quickshell
import Quickshell.Io

import qs.common

Singleton {
    id: root

    readonly property string source: Settings.cacheDockerDir + "data.json"

    function init() {
    }

    FileView {
        id: file

        path: root.source

        watchChanges: true
        onFileChanged: reload()

        onLoadFailed: err => {
            if (err == FileViewError.FileNotFound) {
                // this.writeAdapter();
            }
        }
    }

    function getData() {
        return JSON.parse(file.text());
    }

    Process {
        id: scan
        running: false
        command: ["sudo", "docker", "ps", "--format=\"json\""]
    }
}
