import QtQuick 2.2
import Sailfish.Silica 1.0

Item {
    id: tree
    width: 50
    height: 50
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
                diameterInputDialog.open()
            }
        }
        MenuItem {
            text: "Ввести высоту"
            onClicked: {
                heightInputDialog.open()
            }
        }
        MenuItem {
            text: "Выбрать породу"
            onClicked: {
                breedSelectionDialog.open()
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
