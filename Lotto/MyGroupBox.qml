import QtQuick 2.10
import QtQuick.Controls 2.3

GroupBox {
    id: control
        title: qsTr("GroupBox")
        font.pointSize: 20
        font.weight: Font.ExtraBold
        font.family: "Amatic SC"
        //font.letterSpacing: 7
        font.capitalization: Font.AllUppercase
        background: Rectangle {
            y: control.topPadding - control.padding
            width: parent.width
            height: parent.height - control.topPadding + control.padding
            color: "transparent"
            border.color: "#000000"
            border.width: 2
            radius: 2
        }

        label: Label {
            x: control.leftPadding
            y: 10
            font: parent.font
            width: control.availableWidth
            text: control.title
            color: "#F44336"
            elide: Text.ElideLeft
        }
}
