#include "player.h"

Player::Player()
{

}

void Player::putKeg(int value)
{
//    for(Card card : cards) {
//        card.setKeg(value)
//    }
}

QVector<Card> Player::getCards()
{
    return cards;
}

void Player::setCards(QVector<Card> nCards)
{
    cards = nCards;
}
