import QtQuick 2.10
import QtQuick.Controls 2.3
import QtQuick.Layouts 1.3

Pane {
    id: roomTile
    property alias description: description.text
    property alias nickname: nickname.text
    property alias param1: param1.text
    property alias param2: param2.text
    property alias sourceImage: userIcon.source

    background: Rectangle {
        color: "#b15252"
        opacity: 0.8
        radius: 10
    }

    GridLayout {
        anchors.fill: parent
        columns: 3
        rowSpacing: 5
        columnSpacing: 5
        Layout.alignment: Qt.AlignHCenter

        MyLabel {
            id: description
            Layout.fillHeight: true
            Layout.preferredWidth: 150
            Layout.columnSpan: 2
            font.pointSize: 16
            horizontalAlignment: Text.AlignHCenter
            //wrapMode: Text.WordWrap
        }
        MyLabel {
            id: nickname
            Layout.preferredWidth: 150
            Layout.fillHeight: true
            horizontalAlignment: Text.AlignHCenter

        }
        MyLabel {
            text: qsTr("Количество карточек")
            font.pointSize: 15
            Layout.fillHeight: true
            Layout.fillWidth: true

        }
        MyLabel {
            id: param1
            font.pointSize: 15
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        Rectangle {
            Layout.margins: -3
            Layout.fillHeight: true
            Layout.alignment: Qt.AlignHCenter
            Layout.rowSpan: 2
            Layout.preferredWidth: height
            Image {
                id: userIcon
                fillMode: Image.Stretch
                anchors.fill: parent
                source: "user.png"
            }
        }
        MyLabel {
            text: qsTr("Сумма ставки")
            font.pointSize: 15
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
        MyLabel {
            id: param2
            font.pointSize: 15
            Layout.fillHeight: true
            Layout.fillWidth: true
        }
    }
}
