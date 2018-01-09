import QtQuick 2.10
import QtQuick.Controls 2.3

ProgressBar {
    id: control
    value: 0.5
    //padding: 2

    background: Rectangle {
        implicitWidth: 200
        implicitHeight: 8
        color: "#F44336"
        opacity: 0.3
        radius: 3
    }

    contentItem: Item {
        implicitWidth: 200
        implicitHeight: 8

        Rectangle {
            width: control.visualPosition * parent.width
            height: parent.height
            radius: 2
            color: "#F44336"
        }
    }
}
