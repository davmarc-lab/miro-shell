import QtQuick
import QtQuick.Layouts

import qs.common
import qs.services
import qs.widgets

ColumnLayout {
    spacing: 0

    RowLayout {
        id: add

        Layout.fillWidth: true
        Layout.margins: Settings.itemMargin
        Layout.bottomMargin: 0

        MTextInput {
            id: newTodo

            Layout.fillWidth: true

            leftPadding: 10

            placeholderText: "New Todo item"
            placeholderTextColor: Theme.colorOnSurfaceVariant
        }

        MButton {
            text: "Add"

            Keys.onReturnPressed: {
                console.log("ENTER");
            }
            Keys.onEnterPressed: {
                console.log("ENTER");
            }

            onPressed: () => {
                const text = newTodo.text;
                if (text.length) {
                    // add todo
                    STodo.addTodo(text, false);
                    newTodo.text = "";
                }
            }
        }
    }

    Repeater {
        model: STodo.getTodo()

        delegate: TodoItem {
            id: elem

            required property var model

            Layout.fillWidth: true
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
