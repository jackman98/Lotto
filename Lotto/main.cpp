#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "player.h"
#include "carddistribution.h"
#include "card.h"
#include <QDebug>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Card>("GameClasses", 1, 0, "Card");
    qmlRegisterType<Player>("GameClasses", 1, 0, "Player");
    qmlRegisterType<CardDistribution>("GameClasses", 1, 0, "CardDistribution");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

    qRegisterMetaType<QVector<Card*> >("QVector<Card*> >");
    //qRegisterMetaType<Player *>("Player *");
    qRegisterMetaType<Card *>("Card *");

    Player p1, p2;
    CardDistribution dis;
    dis.appointCardsToPlayer(&p1);
    dis.appointCardsToPlayer(&p2);



    qDebug() << "PLAYER1 CARDS: ";
    for(Card *card : p1.getCards()) {
        qDebug() << card->getAllNumbers();
        CardGeneration::showCard(card);
        qDebug() << "\n";
    }

    qDebug() << "PLAYER2 CARDS: ";
    for(Card *card : p2.getCards()) {
        qDebug() << card->getAllNumbers();
        CardGeneration::showCard(card);
        qDebug() << "\n";
    }

    return app.exec();
}
