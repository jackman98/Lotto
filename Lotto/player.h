#ifndef PLAYER_H
#define PLAYER_H
#include <card.h>
#include <QDebug>
#include <QVector>
#include <QObject>

class Player : public QObject
{
    Q_OBJECT

    int IdentProfile; //money
    QVector<Card *> cards;
    bool isReElectionable;

    //поле для отслежения ошибочных нажатий игрока (попытка putKeg *******)
public:
    explicit Player(QObject *parent = nullptr);
    Q_INVOKABLE void putKeg(Card *card, int value);
    Q_INVOKABLE QVector<Card *> getCards();
    Q_INVOKABLE Card *getCard(int index);
    Q_INVOKABLE int amountOfCards();
    void setCards(QVector<Card *> nCards);
};

#endif // PLAYER_H
