pragma ComponentBehavior: Bound
pragma Singleton

import Quickshell
import Quickshell.Io

import QtQuick

import qs.common

Singleton {
    id: root

    property bool ready: false

    function init() {
        getWeather.running = true;
    }

    property var weather: QtObject {
        property real latitude: 0
        property real longitude: 0
        property real generationtime_ms: 0
        property real utc_offset_seconds: 0
        property string timezone: ""
        property string timezone_abbreviation: ""
        property real elevation: 0

        property QtObject current_units: QtObject {
            property string time: ""
            property string interval: ""
            property string temperature_2m: ""
            property string relative_humidity_2m: ""
            property string precipitation: ""
        }

        property QtObject current: QtObject {
            property string time: ""
            property real interval: 0
            property real temperature_2m: 0
            property real relative_humidity_2m: 0
            property real precipitation: 0
        }
        property QtObject hourly_units: QtObject {
            property string time: ""
            property string temperature_2m: ""
            property string relative_humidity_2m: ""
            property string weather_code: ""
        }
        property QtObject hourly: QtObject {
            property var time: []
            property var temperature_2m: []
            property var relative_humidity_2m: []
            property var weather_code: []
        }

        property QtObject daily_units: QtObject {
            property string time: ""
            property string weather_code: ""
            property string temperature_2m_max: ""
            property string temperature_2m_min: ""
        }
        property QtObject daily: QtObject {
            property var time: []
            property var temperature_2m: []
            property var relative_humidity_2m: []
            property var weather_code: []
        }
    }

    Process {
        id: getWeather
        running: false

        command: ["sh", "-c", Settings.scriptPath + "weather/get-weather.sh"]
        stdout: StdioCollector {
            onStreamFinished: {
                getWeather.running = false;
            }
        }
    }

    Timer {
        id: fileReload
        interval: 1000
        repeat: false
        onTriggered: {
            weatherData.reload();
        }
    }

    FileView {
        id: weatherData

        path: Settings.cacheDir + "weather/data.json"

        watchChanges: false
        onFileChanged: reload()

        onLoadFailed: error => {
            if (error === FileViewError.FileNotFound) {
                fileReload.restart();
            }
        }

        onLoaded: {
            root.ready = true;
            root.weather = JSON.parse(this.text());
        }
    }
}
