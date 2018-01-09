import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Page {
    id: home
    width: 900
    height: 600
    property alias myButton2: myButton2
    property alias mouse: mouse
    property alias pane: pane
    property alias progressBar: progressBar
    property alias progress: progress
    property alias myButton1: myButton1
    Image {
        fillMode: Image.Stretch
        source: "background.jpg"
        anchors.fill: parent
    }
    MyButton {
        id: myButton
        x: 575
        y: 37
        width: 135
        height: 36
        text: "Правила"
        onClicked: {
            rules.open()
        }
    }

    Popup {
        id: rules
        width: home.width / 1.5
        height: home.height / 1.5
        modal: true
        focus: true
        x: home.width / 2 - width / 2
        y: home.height / 2 - height / 2
        contentItem: MyLabel {
            text: "ПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилаПравилам"
        }
    }

    MyButton {
        id: myButton1
        x: 735
        y: 37
        width: 135
        height: 36
        text: "Выход"
        onClicked: {
            stackView.pop()
        }
    }

    MyGroupBox {
        id: profile
        x: 257
        y: -7
        width: 296
        height: 382
        title: "Профиль"

        GridLayout {
            id: gridLayout1
            anchors.fill: parent
            columns: 2

            MyFrame {
                id: myFrame1
                Layout.rowSpan: 2
                implicitWidth: 150
                implicitHeight: myFrame1.width

                Image {
                    id: image
                    anchors.fill: parent
                    fillMode: Image.Stretch
                    source: "user.png"
                }
            }

            MyLabel {
                id: nickname
                text: qsTr("Nickname")
            }

            Keg {
                id: keg
                number: 69
            }

            MyProgressBar {
                id: progressBar
                Layout.alignment: Qt.AlignHCenter | Qt.AlignVCenter
                implicitHeight: 10
                Layout.columnSpan: 2
                Layout.fillWidth: true
                value: 0.5
            }

            MyLabel {
                topPadding: -5
                bottomPadding: -5
                id: progress
                font.pointSize: 16
                Layout.alignment: Qt.AlignHCenter
                Layout.columnSpan: 2
                text: "%1/100".arg(progressBar.value * 100)
            }

            MyLabel {
                id: label
                color: "#f44336"
                text: qsTr("Золото :")
            }

            MyLabel {
                id: label2
                text: qsTr("3 K монет")
            }

            MyLabel {
                id: label3
                color: "#f44336"
                text: qsTr("Победы :")
            }

            MyLabel {
                id: label4
                text: qsTr("22405")
            }

            MyLabel {
                id: label5
                color: "#f44336"
                text: qsTr("Поражения :")
            }

            MyLabel {
                id: label6
                text: qsTr("1250")
            }
        }
    }

    MyGroupBox {
        id: myGroupBox1
        x: 257
        y: 376
        width: 613
        height: 200
        title: "Режим игры"
        Layout.columnSpan: 2

        GridLayout {
            id: gridLayout
            columns: 2
            rowSpacing: 0
            columnSpacing: 40
            anchors.fill: parent

            MyLabel {
                id: myLabel
                text: qsTr("Игра с реальными игроками")
                Layout.rowSpan: 2
            }

            RowLayout {
                id: rowLayout
                MyLabel {
                    id: myLabel1
                    text: qsTr("Игра с компьютером")
                }

                Rectangle {
                    id: reg
                    width: 40
                    height: width
                    color: "transparent"
                    radius: width / 2

                    Text {
                        id: t
                        font.pointSize: 20
                        anchors.centerIn: parent
                        text: qsTr("!");
                    }

                    Popup {
                        id: pane
                        x: -90
                        y: -95
                        visible: false
                        background: Rectangle {
                            color: "#F44336"
                            radius: 15
                        }

                        MyLabel {
                            text: qsTr("Игра с ботом дает \nменьше опыта и золота!")
                        }
                    }

                    MouseArea{
                        id: mouse
                        anchors.fill: parent
                        hoverEnabled: true
                        onEntered: {
                            pane.visible = true
                        }
                        onExited: {
                            pane.visible = false
                        }
                    }

                }

            }

            RowLayout {
                MyLabel {
                    color: "#f44336"
                    text: qsTr("Сложность :")
                }

                MyComboBox {
                    id: myLabel3
                    model: ["Easy", "Medium", "Hard"]
                }
            }

            MyButton {
                id: myButton2

                implicitWidth: 215
                implicitHeight: 36
                text: qsTr("Перейти в лобби")
                onClicked: {
                    stackView.push("Lobby.qml")
                }
            }

            MyButton {
                id: myButton3
                implicitWidth: 215
                implicitHeight: 36
                text: qsTr("Начать тренировку")
            }
        }
    }

    MyTabBar {
        id: myTabBar
        x: 575
        y: 86
        width: 295
        height: 289
        position: TabBar.Header

        MyTabButton {
            id: myTabButton
            width: 147
            height: 44
            text: qsTr("Друзья")
            anchors.top: parent.top
            anchors.topMargin: 0
        }

        MyTabButton {
            id: myTabButton1
            x: 147
            width: 147
            height: 44
            text: qsTr("Статистика")
            anchors.top: parent.top
            anchors.topMargin: 0
            visible: true
        }
    }

    Rectangle {
        id: rectangle
        x: -273
        y: 20
        width: 200
        height: 200
        color: "#ffffff"
    }
}

