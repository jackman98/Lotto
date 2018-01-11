#include "player.h"

Player::Player(QObject *parent) : QObject(parent)
{

}

void Player::putKeg(int value, int index)
{
    cards[index]->setKeg(value);
}

QVector<Card *> Player::getCards()
{
    return cards;
}

Card *Player::getCard(int index)
{
    return cards[index];
}

int Player::amountOfCards()
{
    return cards.size();
}

void Player::setCards(QVector<Card *> nCards)
{
    cards = nCards;
}
