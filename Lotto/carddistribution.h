#ifndef CARDDISTRIBUTION_H
#define CARDDISTRIBUTION_H
#include <cardgeneration.h>
#include <QDebug>
#include <player.h>

class CardDistribution
{
    CardGeneration cardGeneration;
    int amountsOfCards;

    QVector<Card> bank;

    void fillBank(int amount);
public:
    CardDistribution();
    void appointCardsToPlayer(Player& player);
};

#endif // CARDDISTRIBUTION_H
