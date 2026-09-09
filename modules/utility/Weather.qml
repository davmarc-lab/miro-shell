import Quickshell

import QtQuick
import QtQuick.Layouts

import qs.common
import qs.widgets
import qs.services

MRectangle {
    radius: 0

    ColumnLayout {
        anchors.fill: parent
        anchors.margins: Settings.panel.margin

        // Location Info
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: parent.height * 0.1
            Layout.alignment: Qt.AlignTop

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Latitude"
                value: SWeather.weather.latitude
            }

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Longitude"
                value: SWeather.weather.longitude
            }

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Elevation"
                value: SWeather.weather.elevation
            }

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Timezone"
                value: SWeather.weather.timezone
            }
        }

        // Current weather
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: parent.height * 0.1
            Layout.alignment: Qt.AlignTop

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Temperature"
                value: SWeather.weather.current.temperature_2m + " " + SWeather.weather.current_units.temperature_2m
            }

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Humidity"
                value: SWeather.weather.current.relative_humidity_2m + SWeather.weather.current_units.relative_humidity_2m
            }
        }

        // Hourly weather
        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            Layout.maximumHeight: parent.height * 0.1
            Layout.alignment: Qt.AlignTop

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Temperature"
                value: SWeather.weather.current.temperature_2m + " " + SWeather.weather.current_units.temperature_2m
            }

            MKeyValText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                key: "Humidity"
                value: SWeather.weather.current.relative_humidity_2m + SWeather.weather.current_units.relative_humidity_2m
            }
        }

        MFillLayout {}
    }
}
