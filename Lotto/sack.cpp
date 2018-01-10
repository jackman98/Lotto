#include "sack.h"
#include <QDebug>

Sack::Sack(QObject *parent) : QObject(parent)
{
    kegs.resize(90);
    std::iota(kegs.begin(), kegs.end(), 1);
    std::random_shuffle(kegs.begin(), kegs.end());
//    qDebug() << "Sack" << kegs;

}

short Sack::nextKegs()
{
    //if sack is not empty
    if (kegs.size() > 0) {
        short keg = kegs.front();
        kegs.pop_front();
        return keg;
    }

    return 0; //sack is empty
}
