import QtQuick 2.0
import Sailfish.Silica 1.0

Item {
    id: tree
    implicitWidth: 50
    implicitHeight: 50
    property string breed: "Осина"
    property real diameter: 0
    property real height: 0

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
                   header.title = "Диаметр: " + dialog.diameter
                     })

                //diameterInputDialog.open()
            }
        }

        MenuItem {
            text: "Ввести высоту"
            onClicked: {
                var dialog = pageStack.push(Qt.resolvedUrl("HeightInputDialog.qml"),
                                             {"height": header.title})
                dialog.accepted.connect(function() {
                    header.title = "Высота: " + dialog.height
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
                    header.title = "Порода: " + dialog.breed
                      })
                //breedSelectionDialog.open()
            }
        }
    }

    Dialog {
        id: diameterInputDialog
        accepted: function (newDiameter) {
            tree.diameter = newDiameter
            saveTreeData()
        }

        DiametInputDialog {
            onAccepted: diameterInputDialog.accepted
        }
    }

    Dialog {
        id: heightInputDialog
        accepted: function (newHeight) {
            tree.height = newHeight
            saveTreeData()
        }

        HeightInputDialog {
            onAccepted: heightInputDialog.accepted
        }
    }

    Dialog {
        id: breedSelectionDialog
        accepted: function (newBreed) {
            setBreed(newBreed)
            saveTreeData()
        }

        BreedSelectionDialog {
            onAccepted: breedSelectionDialog.accepted
        }
    }

    function setBreed(newBreed) {
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
    }

    function saveTreeData() {
        var file = Qt.openFileHandle("TreeData.txt", "a")
        file.writeLine("Tree: " + breed + ", Diameter: " + diameter + ", Height: " + height)
        file.close()
    }
}
