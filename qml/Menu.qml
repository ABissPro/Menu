import QtQuick 2.0
import Sailfish.Silica 1.0

import "pages"

ApplicationWindow {
    id: mainPage

    property var trees: []

    SilicaFlickable {
        id: flickable
        anchors.fill: parent

        Rectangle {
            id: field
            width: flickable.width
            height: flickable.height
            color: "darkgrey"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var newTree = treeComponent.createObject(field, {
                        "x": mouse.x - 25,
                        "y": mouse.y - 25
                    });
                    trees.push(newTree)
                }
            }

            Component {
                id: treeComponent
                TreeButton {}
            }

            Repeater {
                model: trees
                delegate: TreeButton
            }
        }
    }
}
