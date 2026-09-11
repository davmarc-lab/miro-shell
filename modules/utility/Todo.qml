import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

UtilityPage {
    id: root

    isFocused: newTodo.focus

    ColumnLayout {

        anchors.fill: parent
        anchors.margins: Settings.item.margin

        spacing: 0

        RowLayout {
            id: add

            Layout.fillWidth: true
            Layout.margins: Settings.item.margin
            Layout.bottomMargin: 0

            MTextInput {
                id: newTodo

                Layout.fillWidth: true
                implicitHeight: parent.height
                focus: false

                leftPadding: 10

                placeholderText: "New Todo item"
                placeholderTextColor: Theme.colorOnSurfaceVariant
            }

            MRButton {
                id: newTodoAdd
                implicitWidth: height

                contentFontFamily: Icons.fontName
                contentFontSize: Settings.font.iconSize
                text: "\uf23a"

                onPressed: () => addTodo()

                function addTodo() {
                    const text = newTodo.text;
                    if (text.length) {
                        // add todo
                        STodo.addTodo(text, false);
                        newTodo.text = "";
                    }
                }
            }
        }

        // change into ListView
        Repeater {
            model: STodo.getTodo()

            delegate: TodoItem {
                id: elem

                required property var model

                Layout.fillWidth: true
                Layout.leftMargin: 10
                Layout.rightMargin: Layout.leftMargin
                Layout.alignment: Qt.AlignTop

                text: model.content
                checked: model.check

                onTodoCheck: STodo.checkTodo(model.content, true)
                onTodoUncheck: STodo.checkTodo(model.content, false)

                onTodoDelete: STodo.removeTodo(model.content)
            }
        }

        MFillLayout {}
    }
}
