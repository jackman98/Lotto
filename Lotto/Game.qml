import QtQuick 2.10
import QtQuick.Controls 2.3
import GameClasses 1.0

Page {
    width: 900
    height: 600



    Keg {
        id: keg
        number: 0
    }

    Timer {
        interval: 3000
        repeat: true
        running: true
        onTriggered: {
            keg.number++
        }
    }

    Player {
        id: player1
    }

    Player {
        id: player2
    }

    CardDistribution {
        id: cd
    }

    Card1 {
        id: car
        anchors.centerIn: parent
        currentKeg: keg.number
        Component.onCompleted: {
            cd.appointCardsToPlayer(player1)
            console.log(player1.amountOfCards())
            console.log(player1.getCard(1).getAllNumbers())
            var s = player1.getCard(0).getAllNumbers()
            car.positions = s.toString().split(",")
        }
    }

}
