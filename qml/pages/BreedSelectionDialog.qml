import QtQuick 2.2
import Sailfish.Silica 1.0


Dialog {
    id: breedSelectionDialog
    property string breed: "Осина"

    PageHeader {
        title: qsTr("Выберите породу")
    }

    SilicaFlickable {
        anchors.fill: parent
        Column {
            spacing: 10
            Button {
                text: qsTr("Осина")
                onClicked: {
                    accepted(breed = "Осина")
                    close()
                }
            }
            Button {
                text: qsTr("Береза")
                onClicked: {
                    accepted(breed = "Береза")
                    close()
                }
            }
            Button {
                text: qsTr("Дуб")
                onClicked: {
                    accepted(breed = "Дуб")
                    close()
                }
            }
            Button {
                text: qsTr("Сосна")
                onClicked: {
                    accepted(breed = "Сосна")
                    close()
                }
            }
            Button {
                text: qsTr("Ель")
                onClicked: {
                    accepted(breed = "Ель")
                    close()
                }
            }
            Button {
                text: qsTr("Лиственница")
                onClicked: {
                    accepted(breed = "Лиственница")
                    close()
                }
            }

           }
       }
}
