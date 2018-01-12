#include "bot.h"

Bot::Bot(QObject *parent) : Player(parent)
{
    IdentProfile = 0;
}

void Bot::putKeg(int value, int index)
{
    for(int i(0); i < 3; i++) {
        cards[i]->setKeg(value);
        checkFillingOfCard(cards[i]);
    }
}
