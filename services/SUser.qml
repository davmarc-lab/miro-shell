pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

import qs
import qs.common

Singleton {
    id: root

    function init() {
    }

    function updateUserImage(path: string): void {
        file.imagePath = path;
    }

    function getUserImageDir(): string {
        return file.userImageDir;
    }

    function getUserImageFile(): string {
        return file.userImageName;
    }

    function getName(): string {
        return file.info.name;
    }

    function getSecondName(): string {
        return file.info.secondName;
    }

    function getUsername(): string {
        return file.info.username;
    }

    FileView {
        id: userData

        path: Settings.cache.user + "data.json"

        watchChanges: false
        onFileChanged: reload()

        JsonAdapter {
            id: file

            property string userImageDir: ""
            property string userImageName: ""

            property JsonObject info: JsonObject {
                property string name: ""
                property string secondName: ""
                property string username: ""
            }
        }
    }

    IpcHandler {
        target: "utility"

        function toggle(): void {
            Global.enableUtility = !Global.enableUtility;
        }
    }

    IpcHandler {
        target: "dock"

        function toggle(): void {
            Global.enableDock = !Global.enableDock;
        }
    }

    IpcHandler {
        target: "side"

        function toggle(): void {
            Global.enableRightPanel = !Global.enableRightPanel;
        }
    }
}
