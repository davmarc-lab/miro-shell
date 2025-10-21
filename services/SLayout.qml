pragma Singleton

import Quickshell
import Quickshell.Io
import Quickshell.Hyprland

import QtQuick

import qs.common

Singleton {
    id: root

    property string current: ""

    function getShortName(name: string): string {
        return name.substring(0, 2).toLowerCase();
    }

    function handleEvent(event): void {
        if (event.name === "activelayout") {
            const data = event.data;
            const layoutInfo = data.split(",");
            current = root.getShortName(layoutInfo[layoutInfo.length - 1]);
        }
    }

    Process {
        id: first
        running: false

        command: ["sh", "-c", Settings.scriptPath + "keyboard/get-layout.sh"]

        stdout: StdioCollector {
            onStreamFinished: {
                root.current = root.getShortName(this.text);
            }
        }
    }

    Component.onCompleted: {
        // query current layout
        first.running = true;

        Hyprland.rawEvent.connect(handleEvent);
    }
}
