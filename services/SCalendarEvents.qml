pragma Singleton
pragma ComponentBehavior: Bound

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common

Singleton {
    id: root
    property string source: Settings.cache.calendar + "calendar.json"

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

    function addEvent(desc: string, eventDate: date, hour: int, minutes: int, duration: int) {
        data.data.push({
            description: desc,
            eventDate: eventDate.toISOString().split("T")[0],
            eventTime: {
                hour: hour,
                minutes: minutes
            },
            eventDuration: duration
        });
    }

    function getEvents(): list<var> {
        return data.data;
    }
}
