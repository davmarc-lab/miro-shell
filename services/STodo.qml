pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property string source: Settings.cache.todo + "todo.json"

    FileView {
        id: file

        path: root.source

        watchChanges: true
        onFileChanged: reload()

        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: data

            property list<var> data
        }

        onLoadFailed: err => {
            if (err == FileViewError.FileNotFound) {
                this.writeAdapter();
            }
        }
    }

    function getTodo() {
        return data.data;
    }

    function addTodo(source: string, checked: bool) {
        data.data.push({
            content: source,
            check: checked
        });
    }

    function removeTodo(source: string) {
        data.data = data.data.filter(t => t.content != source);
    }

    function checkTodo(content: string, check: bool) {
        // find todo
        data.data.filter(s => s.content == content).forEach(t => {
            t.check = check;
        });
    }

    function dump() {
        console.log(file.data.data);
    }
}
