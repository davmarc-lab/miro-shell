pragma ComponentBehavior: Bound
pragma Singleton

import Quickshell
import Quickshell.Io

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

        path: Settings.cacheDir + "user/data.json"

        watchChanges: true
        onFileChanged: reload()

        onAdapterUpdated: writeAdapter()

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
}
