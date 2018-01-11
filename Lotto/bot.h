#ifndef BOT_H
#define BOT_H

#include <QObject>
#include <player.h>
#include <QDebug>

class Bot : private Player
{
    Q_OBJECT
public:
    explicit Bot();

    void putKeg(int value, int index);

signals:

public slots:
};

#endif // BOT_H
