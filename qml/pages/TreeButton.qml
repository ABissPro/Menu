import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: tree
    width: 90
    height: 90
    property string breed: "Осина"
    property real diameter: 0
    property real tall: 0

    Rectangle {
        id: circle
        width: parent.width
        height: parent.height
        radius: width / 2
        color: "lightgreen"

        MouseArea {
            anchors.fill: parent
            onClicked: {
                contextMenu.open()
            }

        }
    }

    ContextMenu {
        id: contextMenu
        MenuItem {
            text: "Ввести диаметр"
            onClicked: {
               var dialog = pageStack.push(Qt.resolvedUrl("DiameterInputDialog.qml"),
                                            {"diameter": header.title})
               dialog.accepted.connect(function() {
                   text = "Диаметр: " + dialog.diameter
                     })
                //diameterInputDialog.open()
            }
            onDelayedClick: {
                var dialog = pageStack.push(Qt.resolvedUrl("DiameterInputDialog.qml"),
                                             {"diameter": header.title})
                dialog.accepted.connect(function() {
                    circle.radius = dialog.diameter/1.5
                      })
            }
        }

        MenuItem {
            text: "Ввести высоту"
            onClicked: {
                var dialog = pageStack.push(Qt.resolvedUrl("TallInputDialog.qml"),
                                             {"tall": header.title})
                dialog.accepted.connect(function() {
                    text = "Высота: " + dialog.tall
                      })
                //heightInputDialog.open()
            }
        }
        MenuItem {
            text: "Выбрать породу"
            onClicked: {
                var dialog = pageStack.push(Qt.resolvedUrl("BreedSelectionDialog.qml"),
                                             {"breed": header.title})
                dialog.accepted.connect(function() {
                    text = "Порода: " + dialog.breed
                      })
                //breedSelectionDialog.open()
            }
            onDelayedClick: {
                var dialog = pageStack.push(Qt.resolvedUrl("BreedSelectionDialog.qml"),
                                             {"breed": header.title})
                dialog.accepted.connect(function setBreed(newBreed) {

                        breed = newBreed
                        switch (newBreed) {
                            case "Осина":
                                circle.color = "lightgreen"
                                break;
                            case "Береза":
                                circle.color = "blue"
                                break;
                            case "Дуб":
                                circle.color = "grey"
                                break;
                            case "Сосна":
                                circle.color = "orange"
                                break;
                            case "Ель":
                                circle.color = "purple"
                                break;
                            case "Лиственница":
                                circle.color = "green"
                                break;
                        }
                    })
            }
        }
        Button {
            text: qsTr("Сохранить")
            onClicked: {

                contextMenu.close()
            }

        }
        onClosed: {
            function saveTreeData() {
                var file = Qt.openFileHandle("TreeData.txt", "a")
                file.writeLine("Порода: " + breed + ", диаметр: " + diameter + ", высота: " + tall)
                file.close()
            }
        }
    }   
}
