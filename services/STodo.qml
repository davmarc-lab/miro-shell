pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common

Singleton {
    id: root

    readonly property string source: Settings.cache.todo + "todo.json"
    readonly property string serverSource: Settings.cache.todo + "server.json"

    FileView {
        id: serverFile

        path: root.serverSource

        watchChanges: true
        onFileChanged: reload()

        onAdapterUpdated: writeAdapter()

        JsonAdapter {
            id: serverData

            property list<var> data
        }

        onLoadFailed: err => {
            if (err == FileViewError.FileNotFound) {
                this.writeAdapter();
            }
        }
    }

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
        // this.retrieveTodos();
        const todos = [];
        data.data.forEach(t => todos.push(t));
        serverData.data.forEach(t => todos.push(t));
        return todos;
    }

    function callApi(url) {
        return new Promise(function (resolve, reject) {
            var xhr = new XMLHttpRequest();
            xhr.open("GET", url, true);

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        try {
                            var data = JSON.parse(xhr.responseText);
                            resolve(data);
                        } catch (e) {
                            reject("Failed to parse JSON: " + e);
                        }
                    } else {
                        reject("API error, status: " + xhr.status);
                    }
                }
            };

            xhr.send();
        });
    }

    function retrieveTodos() {
        console.log("Fetching data...");
        callApi("http://michael:5076/api/todo/user/mil2442").then(function (data) {
            const todos = data.map(e => {
                return {
                    check: e["done"],
                    content: e["text"]
                };
            });

            serverData.data = [];
            todos.forEach(t => {
                serverData.data.push(t);
            });
        }).catch(function (error) {
            console.error("Error:", error);
            return undefined;
        });
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

    function init() {
        this.retrieveTodos();
    }
}
