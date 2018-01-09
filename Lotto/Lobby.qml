import QtQuick 2.4
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.3

Page {
    width: 900
    height: 600
    Image {
        fillMode: Image.Stretch
        source: "backgroundLobby.jpg"
        anchors.fill: parent
    }

    ColumnLayout {
        id: columnLayout
        anchors.fill: parent

        RowLayout {
            Layout.topMargin: 15
            id: rowLayout
            implicitHeight: 40
            Layout.fillWidth: true
            Layout.alignment: Qt.AlignHCenter
            RoundButton {
                text: "\u25C0"
                Layout.fillHeight: true
                Layout.preferredWidth: height
                onClicked: {
                    stackView.pop()
                }
                background: Rectangle {
                    radius:  width/ 2
                    color: "transparent"
                    border.color: "#000000"
                }
            }

            MyComboBox {
                model: ['10', '15']
                id: myComboBox
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            MyComboBox {
                id: myComboBox1
                Layout.fillHeight: true
                Layout.fillWidth: true
            }

            MyLabel {
                text: qsTr("nickname")
                Layout.fillHeight: true
                Layout.fillWidth: true
                horizontalAlignment: Text.AlignRight
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.preferredWidth: height
                Image {
                    id: userIcon
                    fillMode: Image.Stretch
                    anchors.fill: parent
                    source: "user.png"
                }
            }

            Button {
                id: myButton
                Layout.fillHeight: true
                Layout.fillWidth: true
                text: qsTr("Создать новую")
            }



        }
        Flickable {
            id: flickable
            topMargin: 15
            anchors.top: rowLayout.bottom
            anchors.right: parent.right
            anchors.left: parent.left
            anchors.bottom: parent.bottom
            boundsBehavior: Flickable.StopAtBounds

            contentHeight: gridLayout.height

            GridLayout {
                id: gridLayout
                width: flickable.width
                columnSpacing: 10
                rowSpacing: 10
                columns: 2

                RoomTile {
                    id: roomTile1
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    param2: "25"
                    param1: "15"
                    nickname: "jackman98awe"
                    description: "sdadsa"
                }

                RoomTile {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    param2: "25"
                    param1: "15"
                    nickname: "jackman98"
                    description: "Qwerty"
                }
                RoomTile {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                    param2: "25"
                    param1: "15"
                    nickname: "jackman98"
                    description: "Qwerty"
                }

                RoomTile {
                    Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter

                    param2: "25"
                    param1: "15"
                    nickname: "jackman98"
                    description: "Qwerty"
                }
            }
            ScrollIndicator.vertical: ScrollIndicator { }
        }
    }
}

