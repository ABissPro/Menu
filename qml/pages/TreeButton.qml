import QtQuick 2.2
import Sailfish.Silica 1.0


Item {
    id: tree
    width: 90
    height: 90
    visible: true
    property string breed: "Осина"
    property real diameter: 0
    property real tall: 0


    Rectangle {
        id: circle
        width: parent.width
        height: parent.height
        radius: width / 2
        color: "lightgreen"
        z: 100
    }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("ContextMenu about to open");
                contextMenu.open()
            }
        }

        ComboBox {
        id: treeData

        menu: ContextMenu {
            id: contextMenu
            anchors.centerIn: parent


            MenuItem {
                text: "Ввести диаметр"
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("DiameterInputDialog.qml"), {"diameter": tree.diameter})
                    dialog.accepted.connect(function() {
                        tree.diameter = dialog.diameter
                        circle.width = dialog.diameter / 0.5
                        circle.height = dialog.diameter / 0.5
                        circle.radius = circle.width / 2
                        text = "Диаметр: " + dialog.diameter
                    })
                }
            }

            MenuItem {
                text: "Ввести высоту"
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("TallInputDialog.qml"), {"tall": tree.tall})
                    dialog.accepted.connect(function() {
                        tree.tall = dialog.tall
                        text = "Высота: " + dialog.tall
                    })
                }
            }

            MenuItem {
                text: "Выбрать породу"
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("BreedSelectionDialog.qml"), {"breed": tree.breed})
                        dialog.accepted.connect(function() {
                            if (dialog.breed !== undefined) {
                                 tree.breed = dialog.breed
                                 text = "Порода: " + dialog.breed
                                 switch (dialog.breed) {
                                    case (dialog.breed = "Осина"):
                                        circle.color = "lightgreen"
                                        break;
                                    case (dialog.breed = "Береза"):
                                        circle.color = "blue"
                                        break;
                                    case (dialog.breed = "Дуб"):
                                        circle.color = "grey"
                                        break;
                                    case (dialog.breed = "Сосна"):
                                        circle.color = "orange"
                                        break;
                                    case (dialog.breed = "Ель"):
                                        circle.color = "purple"
                                        break;
                                    case (dialog.breed = "Лиственница"):
                                        circle.color = "green"
                                        break;
                                   }
                             } else {
                                 console.log("Порода не определена")
                               }
                          })
                  }
             }

            Button {
                text: qsTr("Сохранить")
                onClicked: {
                    saveTreeData();
                    contextMenu.close();
                }
            }
        }
}
        function saveTreeData() {
            var data = "Порода: " + tree.breed + ", диаметр: " + tree.diameter + ", высота: " + tree.tall + "\n";
            var file = Qt.openFile("TreeData.txt", "a");
            if (file) {
                file.write(data);
                file.close();
            } else {
                console.log("Не удалось открыть файл для записи");
            }
        }
    }


