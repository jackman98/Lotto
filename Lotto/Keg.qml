import QtQuick 2.10

Rectangle {
    property int number: 0
    color: "transparent"
    border.color: "#F44336"
    border.width: 4
    width: 60
    height: 60
    radius: width / 2
    Text {
        id: text
        text: "%1".arg(number)
        anchors.fill: parent
        font.pointSize: 20
        font.capitalization: Font.AllUppercase
        color: "#F44336"
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideMiddle
    }
}
