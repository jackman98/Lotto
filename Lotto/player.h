#ifndef PLAYER_H
#define PLAYER_H
#include <card.h>
#include <QDebug>
#include <QVector>

class Player
{
    int IdentProfile; //money
    QVector<Card> cards;
    bool isReElectionable;

    //поле для отслежения ошибочных нажатий игрока (попытка putKeg *******)
public:
    Player();
    void putKeg(int value);
    QVector<Card> getCards();
    void setCards(QVector<Card> nCards);
};

#endif // PLAYER_H
