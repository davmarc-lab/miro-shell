import Quickshell
import Quickshell.Io

import QtQuick

import qs.widgets

MPanelWindow {
    id: root
    property string query: ""
    anchors {
        left: true
    }

    Process {
        id: findProcess
        running: false
        command: ["fd", root.query, Quickshell.env("HOME")]
        stdout: StdioCollector {
            onStreamFinished: {
                console.log(this.text);
            }
        }
    }

    onQueryChanged: findProcess.running = true
}
