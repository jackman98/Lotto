#include "bot.h"

Bot::Bot(QObject *parent) : Player(parent)
{

}

void Bot::putKeg(int value, int index)
{
    for(int i(0); i < 3; i++) {
        cards[i]->setKeg(value);
        checkFillingOfCard(cards[i]);
    }
}
