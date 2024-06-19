import QtQuick 2.2
import Sailfish.Silica 1.0


Dialog {
    id: tallInputDialog

    property real tall: 0

    PageHeader {
        title: qsTr("Введите высоту")
    }

    SilicaFlickable {
        anchors.fill: parent
        Column {
            spacing: 10
            TextField {
                id: inputTall
                placeholderText: qsTr("Введите высоту")
                onTextChanged: {
                    var newTall = parseFloat(inputTall.text)
                    if (!isNaN(newTall)) {
                        tall = newTall
                    }
                }
            }
            Button {
                text: qsTr("Сохранить")
                onClicked: {
                    accepted(tall)
                    close()
                }
            }
        }
    }
  }

