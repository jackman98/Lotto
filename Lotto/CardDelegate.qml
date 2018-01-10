import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle {
    signal cellClicked(int value)
    property int currentKeg: -1
    property alias model: rep.model
    width: grid.width + 10
    height: grid.height + 10
    border.color: "#000000"
    border.width: 2
    Image {
        id: background
        anchors.fill: parent
        source: "/backgroundCard.jpg"
    }
    GridLayout {
        id: grid
        anchors.centerIn: parent
        columns: 9
        Repeater {
            id: rep
            model: s
            Rectangle {
                width: 30
                height: width
                color: "transparent"
                border.color: "#000000"
                border.width: 1
                Text {
                    id: value
                    anchors.fill: parent
                    text: modelData != 0 ? modelData : ""
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                Keg {
                    id: kegImage
                    anchors.margins: 1
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

