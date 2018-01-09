import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Dialogs 1.2
import QtQuick.Layouts 1.3

Page {
    id: wind
    height: 600
    width: 900
    ColumnLayout {
        id: auth
        anchors.centerIn: parent
        spacing: 15
        width: parent.width / 3
        MyLabel {
            id: icon
            text: "Lotto"
            Layout.fillWidth: true
            horizontalAlignment: Text.AlignHCenter
            font.pointSize: 26
        }

        TextField {
            id: login
            Layout.fillWidth: true
            placeholderText: qsTr("Логин")
            onEditingFinished: {
                //m.login = login.text
            }

        }

        TextField {
            id: password
            Layout.fillWidth: true
            placeholderText: qsTr("Пароль")
            echoMode: TextInput.Password
            onEditingFinished: {
                //m.password = password.text
            }

        }

        MyButton {
            id: enter
            Layout.fillWidth: true

            text: qsTr("Войти")
            onClicked: {
                stackView.push("Home.qml")
            }
        }
    }

    Rectangle {
        id: reg
        width: 40
        height: 40
        x: wind.width - width - y
        y: 30
        color: "#be6f6f"
        radius: 20
        property alias text_: t.text
        property alias fsize: t.font.pointSize
        states: [
            State {
                name: "unhovered"
                PropertyChanges {
                    target: reg
                    width: 40
                    text_: qsTr("Р")
                    fsize: 16

                }
            },
            State {
                name: "hovered"
                PropertyChanges {
                    target: reg
                    width: 120
                    text_: qsTr("Регистрация")
                    fsize: 13
                }
            }

        ]
        transitions:
            Transition {
            NumberAnimation {
                properties: "width";
                easing.type: Easing.InOutQuad;
                duration: 300
            }
            PropertyAnimation {
                target: t
                property: "opacity"
                from: 0
                to: 1
                easing.type: Easing.InExpo
                duration: 400
            }
        }
        Text {
            id: t
            font.pointSize: 16
            anchors.centerIn: parent
            text: qsTr("Р");
        }

        MouseArea{
            id: mouse
            anchors.rightMargin: 1
            anchors.bottomMargin: 0
            anchors.leftMargin: -1
            anchors.topMargin: 0
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                reg.state = "hovered"
            }
            onExited: {
                reg.state = "unhovered"
            }
            onClicked: {
                wind.visible = false
                regis.visible = true
                defaultStateRegis()
                defaultStateAuth()
            }
        }

    }

    MessageDialog {
        id: error
        //modality: Qt.NonModal
        icon: StandardIcon.Warning
    }

    Page {
        id: regis
        anchors.fill: parent
        visible: false

        FocusScope {
            id: registration
            anchors.fill: parent
            Keys.onPressed: {
                if (event.key === 16777220 || event.key === Qt.Key_Enter)
                    checked();
            }
            Label {
                anchors.horizontalCenter: parent.horizontalCenter
                font.pointSize: 12
                text: "Здесь Вы можете зарегистрироваться\nв программе"
            }
            ColumnLayout {
                y: parent.height / 2 - height / 1.5
                x: parent.width / 2 - width / 2
                spacing: 10
                TextField {
                    id: login_
                    placeholderText: qsTr("Логин")
                }
                TextField {
                    id: password_
                    echoMode: TextInput.Password
                    placeholderText: qsTr("Пароль")
                    /*onTextChanged: {
                        if (password_.text != password_2.text)
                            password_2.state = "bad"
                    }*/
                }
                TextField {
                    id: password_2
                    echoMode: TextInput.Password
                    placeholderText: qsTr("Повторите пароль")
                    onTextChanged: {
                        if (password_.text != password_2.text)
                            password_2.state = "bad"
                        else if (password_.text == "")
                        {
                            password_.state = "bad"
                            password_2.state = "bad"
                        }
                        else {
                            password_2.state = "good"
                            password_.state = "good"
                        }

                    }
                }
            }

            Row {
                anchors.bottom: parent.bottom
                spacing: 20
                padding: 15
                width: parent.width
                MyButton {
                    text: qsTr("Регистрация")
                    width: parent.width / 2 - parent.spacing / 2 - parent.padding
                    onClicked: {
                        //                        checked()
                        regis.visible = true
                    }
                }
                MyButton {
                    text: qsTr("Удалить базу!")
                    width: parent.width / 2 - parent.spacing / 2 - parent.padding
                    onClicked: data.deleteData();
                }
                MyButton {
                    text: qsTr("Отмена")
                    width: parent.width / 2 - parent.spacing / 2 - parent.padding
                    onClicked: {
                        regis.close()
                        wind.visible = true
                    }
                }

            }
        }
        Dialog {
            id: userExist
            title: "Такой пользователь уже существует!"
        }
    }
}
