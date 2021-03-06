import QtQuick 2.10
import QtQuick.Controls 2.3
import GameClasses 1.0
import QtQuick.Layouts 1.3

Rectangle {
    property int msecForTimer: 3000
    id: mainRec
    anchors.fill: parent
    Popup {
        id: startGame
        width: parent.width
        height: parent.height
        dim: true
        //modal: true
        focus: true
        closePolicy: Popup.NoAutoClose
        background: Rectangle {
            anchors.fill: parent
            color: "transparent"
            MyLabel {
                id: lbl
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pointSize: 60
                property int second: 5
                text: qsTr("Гра розпочнеться через %1".arg(second))
            }
        }
    }

    Timer {
        id: startGameTimer
        interval: 1000
        repeat: true

        onTriggered: {
            lbl.second--
            if (lbl.second === 0) {
                startGame.close()
                startGameTimer.stop()
                keg.number = sack.nextKeg()
                for(var j = 0; j < 3; j++)
                    repForBot.itemAt(j).changeCellState()
                timer.start()
            }
        }

    }

    Sack {
        id: sack
        Component.onCompleted: shuffle()
    }

    Player {
        id: player1
        onPlayerWon: {
            console.log("#######STOP###########")
            timer.stop()
        }
    }

    Bot {
        id: bot
        onPlayerWon: {
            console.log("#######STOP BOT WINNER###########")
            timer.stop()
        }
    }


    CardDistribution {
        id: cd
    }

    Page {
        anchors.fill: parent

        Image {
            anchors.fill: parent
            source: "/backgroundGame.jpg"
        }

        Component.onCompleted: {
            startGame.open()
            startGameTimer.running = true;
        }

        ColumnLayout {
            id: mainCol
            //            width: parent.width
            //            height: 700
            anchors.fill: parent
            RowLayout {
                id: gameInfo
                Layout.fillWidth: true
                Layout.alignment: Qt.AlignHCenter
                GridLayout {
                    id: firstPlayer
                    //Layout.fillWidth: true

                    //Layout.alignment: Qt.AlignHCenter
                    rows: 2
                    flow: GridLayout.TopToBottom

                    MyLabel {
                        id: nickname1
                        text: qsTr("Nickname")
                    }
                    MyFrame {
                        id: myFrame1
                        implicitWidth: 75
                        implicitHeight: myFrame1.width

                        Image {
                            id: image1
                            anchors.fill: parent
                            fillMode: Image.Stretch
                            source: "user.png"
                        }
                    }
                    MyLabel {

                    }
                    ColumnLayout {
                        //Layout.fillHeight: true
                        spacing: 5
                        MyLabel {
                            id: level1
                            //Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Level")
                        }
                        MyLabel {
                            id: money1
                            //Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Money")
                        }
                    }
                }

                MyFrame {
                    RowLayout {
                        Keg {
                            id: keg
                            color: "#FFEB3B"
                            number: 0
                        }
                        MyLabel {
                            id:time
                            property int sec: 5
                            text: qsTr("%1 секунд".arg(sec))
                        }

                        Timer {
                            id: timer
                            interval: msecForTimer
                            repeat: true

                            onTriggered: {
                                keg.number = sack.nextKeg()
                                for(var j = 0; j < 3; j++)
                                    repForBot.itemAt(j).changeCellState()
                            }

                        }

                        ColumnLayout {
                            MyLabel {
                                text: qsTr("Банк")
                            }
                            MyLabel {
                                id:bank
                                text: qsTr("1000")
                            }
                        }
                    }
                }

                GridLayout {
                    //anchors.horizontalCenter: parent.horizontalCenter
                    rows: 2
                    flow: GridLayout.TopToBottom

                    MyLabel {

                    }
                    ColumnLayout {
                        //Layout.fillHeight: true
                        MyLabel {
                            id: level2
                            //Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Level")
                        }
                        MyLabel {
                            id: money2
                            //Layout.alignment: Qt.AlignHCenter
                            text: qsTr("Money")
                        }
                    }

                    MyLabel {
                        id: nickname2
                        text: qsTr("Nickname")
                    }
                    MyFrame {
                        id: myFrame2
                        implicitWidth: 75
                        implicitHeight: myFrame2.width

                        Image {
                            id: image2
                            anchors.fill: parent
                            fillMode: Image.Stretch
                            source: "user.png"
                        }
                    }

                }
            }

            RowLayout {
                Layout.alignment: Qt.AlignHCenter
                Layout.fillHeight: true

                ColumnLayout {
                    id: playerCards
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true


                    Component.onCompleted: {
                        cd.appointCardsToPlayer(player1)
                        //                                        console.log(player1.amountOfCards())
                        //                    console.log("DDDD:" + player1.getCard(0))
                        //                    console.log("DDDD:" + player1.getCard(1))
                        //                    console.log("DDDD:" + player1.getCard(2))
                        repForPlayer.model = player1.amountOfCards()
                        console.log(mainCol.height)
                        console.log(gameInfo.height)
                        console.log((mainCol.height - gameInfo.height) / 4)
                    }


                    Repeater {
                        id: repForPlayer
                        model: player1.amountOfCards()
                        CardDelegate {
                            currentKeg: keg.number
                            indexOfCards: index
                            size: (mainCol.height - gameInfo.height) / 10
                            model: {
                                var s = player1.getCard(index).getAllNumbers()
                                s.toString().split(",")
                            }
                            onCellClicked: {
                                player1.putKeg(value, index)
                            }
                        }
                    }
                }

                ColumnLayout {
                    id: botCards
                    Layout.alignment: Qt.AlignHCenter
                    Layout.fillWidth: true
                    Layout.fillHeight: true


                    Component.onCompleted: {
                        cd.appointCardsToPlayer(bot)
                        //                                        console.log(player1.amountOfCards())
                        //                    console.log("DDDD:" + player1.getCard(0))
                        //                    console.log("DDDD:" + player1.getCard(1))
                        //                    console.log("DDDD:" + player1.getCard(2))
                        repForBot.model = bot.amountOfCards()
                    }


                    Repeater {
                        id: repForBot
                        model: bot.amountOfCards()
                        CardDelegate {
                            currentKeg: keg.number
                            indexOfCards: index
                            size: (mainCol.height - gameInfo.height) / 10
                            model: {
                                var s = bot.getCard(index).getAllNumbers()
                                s.toString().split(",")
                            }
                            onCellClicked: {
                                bot.putKeg(value, index)
                            }
                        }
                    }
                }
            }


        }

    }
}
