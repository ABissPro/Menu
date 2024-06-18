import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    id: breedSelectionDialog

    signal accepted(string breed)

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
                    accepted("Осина")
                    dialog.close()
                }
            }
            Button {
                text: qsTr("Береза")
                onClicked: {
                    accepted("Береза")
                    dialog.close()
                }
            }
            Button {
                text: qsTr("Дуб")
                onClicked: {
                    accepted("Дуб")
                    dialog.close()
                }
            }
            Button {
                text: qsTr("Сосна")
                onClicked: {
                    accepted("Сосна")
                    dialog.close()
                }
            }
            Button {
                text: qsTr("Ель")
                onClicked: {
                    accepted("Ель")
                    dialog.close()
                }
            }
            Button {
                text: qsTr("Лиственница")
                onClicked: {
                    accepted("Лиственница")
                    dialog.close()
                }
            }
        }
    }
}
