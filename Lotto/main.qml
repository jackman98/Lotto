import QtQuick 2.10
import QtQuick.Controls 2.3

ApplicationWindow {
    id: window
    visible: true
    minimumHeight: 600
//    maximumHeight: 600
    minimumWidth: 900
//    maximumWidth: 900

//    property int previousX
//    property int previousY

    title: qsTr("Lotto")

    StackView {
        id: stackView
        anchors.fill: parent
        initialItem: "Game.qml"

//        MouseArea {
//            anchors.fill: parent

//            onPressed: {
//                previousX = mouseX
//                previousY = mouseY
//            }

//            onMouseXChanged: {
//                var dx = mouseX - previousX
//                window.setX(window.x + dx)
//            }

//            onMouseYChanged: {
//                var dy = mouseY - previousY
//                window.setY(window.y + dy)
//            }
//        }
    }

}
