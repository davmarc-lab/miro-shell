import QtQuick

import qs.common

Item {
    id: root
    property bool needsScroll: content.implicitWidth > root.width
    property bool hasPlayed: false

    property alias color: content.color
    property alias text: content.text

    clip: true

    MText {
        id: content
        color: Theme.colorOnSurface
        y: (root.height - height) / 2

        SequentialAnimation {
            id: scrollAnim

            NumberAnimation {
                target: content
                property: "x"
                to: -(content.implicitWidth - root.width) - 4
                duration: Math.max(800, (content.implicitWidth - root.width) * 15)
                easing.type: Easing.InOutQuad
            }

            PauseAnimation {
                duration: 1000
            }

            OpacityAnimator {
                target: content
                from: 1
                to: 0
                duration: 200
            }

            NumberAnimation {
                target: content
                property: "x"
                to: 0
                duration: 0
            }

            OpacityAnimator {
                target: content
                from: 0
                to: 1
                duration: 200
            }
        }
    }

    function startScroll() {
        if (this.needsScroll && !this.hasPlayed) {
            this.hasPlayed = true;
            scrollAnim.start();
        }
    }

    function resetScroll() {
        scrollAnim.stop();
        content.x = 0;
        content.opacity = 1;
        this.hasPlayed = false;
    }
}
