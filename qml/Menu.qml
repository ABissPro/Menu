import QtQuick 2.2
import Sailfish.Silica 1.0

import "pages"

ApplicationWindow {
    id: mainPage

    property var trees: []

    initialPage: Component {
            Page {
                id: mainPageContent

    SilicaFlickable {
        id: flickable
        anchors.fill: parent

        Rectangle {
            id: field
            width: flickable.width
            height: flickable.height
            color: "Black"

            MouseArea {
                anchors.fill: parent
                onClicked: {
                    var newTree = treeComponent.createObject(field, {
                        "x": mouse.x - 45,
                        "y": mouse.y - 45
                    });
                    trees.push(newTree)
                    ;
                }
            }

            Component {
                id: treeComponent
                TreeButton {}
            }

            Repeater {
                model: trees
                delegate: TreeButton {}

            }
        }
    }
}
}
}
