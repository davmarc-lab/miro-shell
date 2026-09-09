import qs.common

MRectangle {
    property bool vertical: false

    readonly property int size: this.vertical ? parent.height : parent.width

    implicitWidth: this.vertical ? 1 : this.size
    implicitHeight: this.vertical ? this.size : 1

    color: Theme.colorOutline
}
