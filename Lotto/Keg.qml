import QtQuick 2.10

Item {
    id: m
    property int number: 0
    property string color: "#F44336"
    property alias fontSize: text.font.pointSize
    width: 60
    height: 60
    Rectangle {
        color: "transparent"
        border.color: m.color
        border.width: 4
        width: m.width
        height: m.height
        radius: width / 2
        Text {
            id: text
            text: "%1".arg(number)
            anchors.fill: parent
            font.pointSize: Math.max(width / 3, 1)
            font.capitalization: Font.AllUppercase
            color: m.color
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideMiddle

        }
    }
}
