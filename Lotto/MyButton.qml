import QtQuick 2.10
import QtQuick.Controls 2.3

Button {
    id: control
    property string colorNoPressed: "#F44336"
    property string colorPressed: "#E91E63"
    flat: true
    font.pointSize: 20
    font.weight: Font.ExtraBold
    font.family: "Amatic SC"
    //font.letterSpacing: 7
    font.capitalization: Font.AllUppercase
    contentItem: Text {
        id: txt
        text: control.text
        font: control.font
        opacity: enabled ? 1.0 : 0.3
        color: control.down ? colorPressed : colorNoPressed
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideMiddle
    }
    background: Rectangle {
        color: "transparent"
        opacity: 1
        border.color: "#000000"
        border.width: 2
        radius: 2
    }
}

