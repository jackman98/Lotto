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
    bool isReElectionable;
protected:
    QVector<Card *> cards;
    //поле для отслежения ошибочных нажатий игрока (попытка putKeg *******)
public:
    explicit Player(QObject *parent = nullptr);
    Player(int id);
    Q_INVOKABLE virtual void putKeg(int value, int index);
    Q_INVOKABLE QVector<Card *> getCards();
    Q_INVOKABLE Card *getCard(int index);
    Q_INVOKABLE int amountOfCards();

    void setCards(QVector<Card *> nCards);
signals:
    void playerWon();
private:
    void checkFillingOfCard(Card *card); //README
};

#endif // PLAYER_H
