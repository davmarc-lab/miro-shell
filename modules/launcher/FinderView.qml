pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

import QtQuick

import qs
import qs.common
import qs.widgets
import qs.services

MFloating {
    id: root
    property string query: ""

    title: "Miro - Finder"

    implicitWidth: 800
    implicitHeight: 600

    function openFile(): void {
        Global.enableFinder = false;
        if (!fileList.currentItem) {
            SNotification.sendNotification("File Finder Error", "File `item` is null", 2);
        }

        const item = fileList.currentItem.modelData;
        if (!item) {
            SNotification.sendNotification("File Finder Error", "There was an error while opening the file", 2);
        }

        const file = item.comment;
        if (!file) {
            SNotification.sendNotification("File Finder Error", "There was an error while opening the file.\n`path` is empty", 2);
        }

        // try open the file
        Quickshell.execDetached({
            command: [...Settings.defaults.fileManagerExec, file]
        });
    }

    Process {
        id: findProcess
        property list<var> files: []
        readonly property bool loading: this.running
        property bool isEmpty: files.length == 0
        readonly property regexp fileNameReg: /(?:\/).*\/(.+)/gm

        running: false
        command: ["fd", root.query, Quickshell.env("HOME")]

        // change it with `SplitParser`
        stdout: StdioCollector {
            onStreamFinished: {
                findProcess.files = [];
                for (const path of this.text.split("\n").filter(p => p)) {
                    const name = findProcess.fileNameReg.exec(path)[1];
                    findProcess.files.push({
                        icon: "",
                        name: name ? name : path,
                        comment: path
                    });
                }
                findProcess.running = false;
            }
        }
    }

    Item {
        id: base
        anchors.fill: parent
        anchors.margins: Settings.panel.margin

        MText {
            id: alertNoResult
            visible: findProcess.isEmpty && !findProcess.loading
            anchors.centerIn: parent
            text: "No result with \"" + root.query + "\" found"
        }

        ListView {
            id: fileList
            visible: !findProcess.isEmpty
            anchors.fill: parent

            focus: true
            clip: true
            spacing: Settings.item.margin
            model: findProcess.loading ? [] : findProcess.files

            Keys.onTabPressed: this.incrementCurrentIndex()
            Keys.onBacktabPressed: this.decrementCurrentIndex()
            Keys.onEscapePressed: Global.enableFinder = false
            Keys.onReturnPressed: visible ? root.openFile() : {}

            delegate: EntryDelegate {
                width: ListView.view.width
                required property int index
                selected: fileList.currentIndex == index

                onEntryClicked: root.openFile()
            }
        }
    }

    onQueryChanged: findProcess.running = true
    onVisibleChanged: Global.enableFinder = visible
}
