#ifndef SACK_H
#define SACK_H

#include <QObject>
#include <QVector>

class Sack : public QObject
{
    Q_OBJECT

    QVector<short> kegs;

public:
    explicit Sack(QObject *parent = nullptr);

    short nextKegs();

signals:

public slots:
};

#endif // SACK_H
