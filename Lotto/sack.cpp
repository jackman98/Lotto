#include "sack.h"
#include <QDebug>

Sack::Sack(QObject *parent) : QObject(parent)
{
    shuffle();
//    qDebug() << "Sack" << kegs;

}

short Sack::nextKeg()
{
    //if sack is not empty
    if (kegs.size() > 0) {
        //short keg = kegs.front();
        //kegs.pop_front();
        short keg = kegs.takeFirst();
        return keg;
    }

    return 0; //sack is empty
}

void Sack::shuffle()
{
    kegs.resize(90);
    std::iota(kegs.begin(), kegs.end(), 1);
    std::random_shuffle(kegs.begin(), kegs.end());
}
