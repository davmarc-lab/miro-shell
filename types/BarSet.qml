import QtQuick

QtObject {
    enum Position {
        Top,
        Left,
        Right,
        Bottom
    }

    enum Orientation {
        Horizontal,
        Vertical
    }

    property int position: BarSet.Position.Top

    // read obnly helpers
    readonly property bool isHorizontal: position === BarSet.Position.Top || position === BarSet.Position.Bottom
    readonly property bool isVertical: position === BarSet.Position.Left || position === BarSet.Position.Right
    readonly property int orientation: isHorizontal ? BarSet.Orientation.Horizontal : BarSet.Orientation.Vertical

    readonly property bool isTop: position === BarSet.Position.Top
    readonly property bool isBottom: position === BarSet.Position.Bottom
    readonly property bool isLeft: position === BarSet.Position.Left
    readonly property bool isRight: position === BarSet.Position.Right

    // readonly property bool isStartAligned: isTop || isLeft
    // readonly property bool isEndAligned: isBottom || isRight
}
