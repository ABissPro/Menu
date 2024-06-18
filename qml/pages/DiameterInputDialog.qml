import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: diameterInputDialog

    signal accepted(real diameter)

    property real diameter: 0

    PageHeader {
        title: qsTr("Введите диаметр")
    }

    SilicaFlickable {
        anchors.fill: parent
        Column {
            spacing: 10
            TextField {
                id: inputDiameter
                placeholderText: qsTr("Введите диаметр")
                onTextChanged: {
                    var newDiameter = parseFloat(inputDiameter.text)
                    if (!isNaN(newDiameter)) {
                        diameter = newDiameter
                    }
                }
            }
            Button {
                text: qsTr("Сохранить")
                onClicked: {
                    accepted(diameter)
                    dialog.close()
                }

            }
        }
    }
}
