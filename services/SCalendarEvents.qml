pragma ComponentBehavior: Bound
pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common
import qs.types

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

            property list<var> events: []
        }

        onLoadFailed: err => {
            if (err == FileViewError.FileNotFound) {
                this.writeAdapter();
            }
        }
    }

    function addEvent(desc: string, eventDate: date, duration: int) {
        data.events.push({
            description: desc,
            eventDate: eventDate,
            eventDuration: duration,
            completed: false
        });
    }

    function compare(a, b) {
        return a.description == b.description && a.eventDate == b.eventDate && a.eventDuration == b.eventDuration && a.completed == b.completed;
    }

    function removeEvent(event) {
        data.events = data.events.filter(e => !compare(e, event));
    }

    function completeEvent(event) {
        data.events.filter(e => compare(e, event)).forEach(e => e.completed = true);
    }

    function getEvents(): list<var> {
        return data.events;
    }

    function getEventsByDate(date) {
        return data.events.filter(d => {
            const day = new Date(d.eventDate);
            day.setHours(0, 0, 0, 0);
            return day.getTime() == date.getTime();
        });
    }

    function init() {
    }
}
