pragma ComponentBehavior: Bound
pragma Singleton

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

            property list<var> events
        }

        onLoadFailed: err => {
            if (err == FileViewError.FileNotFound) {
                this.writeAdapter();
            }
        }
    }

    function addEvent(desc: string, eventDate: date, hour: int, minutes: int, duration: int) {
        data.events.push({
            description: desc,
            eventDate: eventDate,
            eventTime: {
                hour: hour,
                minutes: minutes
            },
            eventDuration: duration
        });
    }

    function getEvents(): list<var> {
        return data.events;
    }

    function getEventsByDate(date) {
        return data.events.filter(d => d == date);
    }

    function init() {
    }
}
