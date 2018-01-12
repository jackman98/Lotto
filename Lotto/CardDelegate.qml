import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Rectangle {
    signal cellClicked(int value, int index)
    signal changeCellState()
    property int currentKeg: -1
    property alias model: rep.model
    property int indexOfCards: -1
    property int size: 30
    implicitWidth: grid.width + 10
    implicitHeight: grid.height + 10
    border.color: "#000000"
    border.width: 2

    Image {
        id: background
        anchors.fill: parent
        source: "/backgroundCard.jpg"
    }
    Grid {
        id: grid
        anchors.centerIn: parent
        columns: 9
        Repeater {
            id: rep
            model: s
            Rectangle {
                id: cell
                property alias valueV: value.text
                property alias visibleV: value.visible
                property alias visibleK: kegImage.visible
                property alias numberK: kegImage.number
                width: size
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
                    font.pointSize: kegImage.fontSize
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
                        if (kegImage.visible === false) {
                            var keg = parseInt(value.text)
                            if (currentKeg === keg) {
                                kegImage.number = keg
                                cellClicked(keg, indexOfCards)
                                value.visible = false
                                kegImage.visible = true
                                console.log(keg)
                                console.log(indexOfCards)
                            }
                        }
                    }
                }
            }
        }
    }

    onChangeCellState: {
        for(var i = 0; i < 3; i++) {
            var indexColumn = currentKeg / 10
            if (indexColumn === 9) indexColumn--
            var keg = parseInt(rep.itemAt(i * 9 + indexColumn).valueV)
            //console.log(currentKeg)
            //console.log(keg)
            if (currentKeg === keg) {
                rep.itemAt(i * 9 + indexColumn).visibleV = false
                rep.itemAt(i * 9 + indexColumn).numberK = keg
                cellClicked(keg, indexOfCards)
                rep.itemAt(i * 9 + indexColumn).visibleK = true
                break
            }
        }
    }
}


