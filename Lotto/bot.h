#ifndef BOT_H
#define BOT_H

#include <QObject>
#include <player.h>
#include <QDebug>

class Bot : public Player
{
    Q_OBJECT
public:
    explicit Bot(QObject *parent = nullptr);

    Q_INVOKABLE void putKeg(int value, int index);

signals:

public slots:
};

#endif // BOT_H
