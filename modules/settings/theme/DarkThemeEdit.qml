import QtQuick.Layouts

import qs.common
import qs.widgets

MContentSubSection {
    id: root
    required property var from

    title: "Dark Theme"
    Layout.alignment: Qt.AlignHCenter
    Layout.preferredWidth: from.itemWidth

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Primary"
            color: Theme.darkPrimary

            onColorChanged: {
                Theme.darkPrimary = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Primary Hover"
            color: Theme.darkPrimaryHover

            onColorChanged: {
                Theme.darkPrimaryHover = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "On Primary"
            color: Theme.darkOnPrimary

            onColorChanged: {
                Theme.darkOnPrimary = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Secondary"
            color: Theme.darkSecondary

            onColorChanged: {
                Theme.darkSecondary = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Secondary Hover"
            color: Theme.darkSecondaryHover

            onColorChanged: {
                Theme.darkSecondaryHover = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "On Secondary"
            color: Theme.darkOnSecondary

            onColorChanged: {
                Theme.darkOnSecondary = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Error"
            color: Theme.darkError

            onColorChanged: {
                Theme.darkError = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "On Error"
            color: Theme.darkOnError

            onColorChanged: {
                Theme.darkOnError = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Surface"
            color: Theme.darkSurface

            onColorChanged: {
                Theme.darkSurface = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "On Surface"
            color: Theme.darkOnSurface

            onColorChanged: {
                Theme.darkOnSurface = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Surface Varian"
            color: Theme.darkSurfaceVariant

            onColorChanged: {
                Theme.darkSurfaceVariant = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "On Surface Variant"
            color: Theme.darkOnSurfaceVariant

            onColorChanged: {
                Theme.darkOnSurfaceVariant = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Outline"
            color: Theme.darkOutline

            onColorChanged: {
                Theme.darkOutline = this.color;
            }
        }
    }

    MContentItem {
        sizex: root.from.itemWidth
        sizey: root.from.itemHeight

        MColorEdit {
            anchors.fill: parent

            text: "Shadow"
            color: Theme.darkShadow

            onColorChanged: {
                Theme.darkShadow = this.color;
            }
        }
    }
}

