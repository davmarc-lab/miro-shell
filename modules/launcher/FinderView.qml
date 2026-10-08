pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

import QtQuick

import qs
import qs.common
import qs.widgets

MFloating {
    id: root
    property string query: ""

    title: "Miro - Finder"

    implicitWidth: 800
    implicitHeight: 600

    Process {
        id: findProcess
        property list<var> files: []
        readonly property bool loading: this.running
        property bool isEmpty: files.length == 0

        running: false
        command: ["fd", root.query, Quickshell.env("HOME")]

        // change it with `SplitParser`
        stdout: StdioCollector {
            onStreamFinished: {
                findProcess.files = [];
                for (const path of this.text.split("\n").filter(p => p)) {
                    findProcess.files.push({
                        icon: "",
                        name: "foo",
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

            delegate: EntryDelegate {
                width: ListView.view.width
                required property int index
                selected: fileList.currentIndex == index
            }
        }
    }

    onQueryChanged: findProcess.running = true
    onVisibleChanged: Global.enableFinder = visible
}
