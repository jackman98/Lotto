#ifndef GAMECARD_H
#define GAMECARD_H
#include <QVector>
#include <card.h>

class CardGeneration
{
public:
    CardGeneration();
    Card* getNewCard();

    static void showCard(Card *card);

private:
    void shuffle_(QVector<int>& arr, int firstIndex = 0, int lastIndex = Card::COLUMNS);
    QVector<int> getPositionsForLine();
    bool comparePositionsOnLines(QVector<int> v1, QVector<int> v2);

    static int countGeneration;
};

#endif // GAMECARD_H
