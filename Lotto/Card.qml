import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Item {
    signal cellClicked(int value)
    property int currentKeg: -2
    property var positions: null
    Rectangle {
        width: grid.width
        height: grid.height
        border.color: "#000000"
        border.width: 2

        GridLayout {
            id: grid
            anchors.centerIn: parent
            columns: 9
            columnSpacing: -1
            rowSpacing: -1
            Repeater {
                model: positions
                Rectangle {
                    width: 30
                    height: width
                    color: "transparent"
                    border.color: "#000000"
                    border.width: 1
                    Text {
                        id: value
                        anchors.fill: parent
                        text: index ? index : ""
                        horizontalAlignment: Text.AlignHCenter
                        verticalAlignment: Text.AlignVCenter
                    }
                    Keg {
                        id: kegImage
                        anchors.margins: 3
                        anchors.fill: parent
                        visible: false
                    }

                    MouseArea {
                        anchors.fill: parent
                        onClicked: {
                            var keg = parseInt(value.text)
                            if (currentKeg === keg) {
                                kegImage.number = keg
                                value.visible = false
                                kegImage.visible = true
                                console.log(keg)
                            }
                        }
                    }
                }
            }
        }
    }
}
