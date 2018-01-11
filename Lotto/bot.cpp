#include "bot.h"

Bot::Bot()
{

}

void Bot::putKeg(int value, int index)
{
    for(int i(0); i < 3; i++) {
        cards[index]->setKeg(value);
    }
}
