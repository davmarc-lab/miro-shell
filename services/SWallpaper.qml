pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common
import qs

Singleton {
    id: root

    function init(): void {
        // retrieve last wallpaper selected
        if (Global.enableWallpaper) {
            Global.enableWallpaper = false;
            get.running = true;
        }
    }

    Process {
        id: update
        running: false
        command: ["sh", "-c", Settings.scriptPath + "wallpaper/update.sh " + root.current]
        stdout: StdioCollector {
            onStreamFinished: {
                update.running = false;
            }
        }
    }

    Process {
        id: get
        running: false
        command: ["sh", "-c", Settings.scriptPath + "wallpaper/get-last.sh"]
        stdout: StdioCollector {
            onStreamFinished: {
                get.running = false;
                root.name = this.text.trim();
                Global.enableWallpaper = true;
            }
        }
    }

    property string path: Settings.wallpaperDir
    property string name: Settings.wallpaperFile
    property string current: name

    function getCurrent(): string {
        return path + current ?? "";
    }

    function setCurrentByIndex(index: int): void {
        if (index >= 0 && index < data.names.length) {
            this.current = data.names[index];
            update.running = true;
        }
    }

    function setCurrent(name: string): void {
        if (data.names.filter(s => s == (path + name)).length) {
            this.current = name;
            update.running = true;
        }
    }

    function getDetected(fullPath = true): bool {
        return fullPath ? data.names.map(s => root.path + s) : data.names;
    }

    Item {
        id: data

        property list<string> names: []

        Process {
            id: wpDetect
            running: Global.enableWallpaper
            command: ["sh", "-c", Settings.scriptPath + "wallpaper/get-all.sh"]
            stdout: StdioCollector {
                onStreamFinished: {
                    wpDetect.running = false;
                    for (var s of this.text.split("\n")) {
                        if (s.length) {
                            data.names.push(s);
                        }
                    }
                }
            }
        }
    }
}
