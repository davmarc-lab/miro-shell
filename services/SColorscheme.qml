pragma Singleton

import Quickshell

import QtQuick
import Qt.labs.folderlistmodel

import qs.common

Singleton {
    id: root

    property list<string> schemes: dir.status === FolderListModel.Ready ? this.updateFiles() : []
    property string active: "default"

    function updateFiles() {
        const elems = [];
        for (let i = 0; i < dir.count; i++)
            elems.push(dir.get(i, "filePath"));
        return elems;
    }

    FolderListModel {
        id: dir
        folder: Qt.resolvedUrl(Settings.dirs.themes)
        nameFilters: ["*.json"]
    }

    function init() {
    }
}
