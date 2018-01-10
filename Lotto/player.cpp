#include "player.h"

Player::Player(QObject *parent) : QObject(parent)
{

}

void Player::putKeg(Card *card, int value)
{
    card->setKeg(value);
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
