#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "player.h"
#include "carddistribution.h"
#include "card.h"
#include <QDebug>
#include <sack.h>
#include <bot.h>

int main(int argc, char *argv[])
{
#if defined(Q_OS_WIN)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    qmlRegisterType<Card>("GameClasses", 1, 0, "Card");
    qmlRegisterType<Player>("GameClasses", 1, 0, "Player");
    qmlRegisterType<Bot>("GameClasses", 1, 0, "Bot");
    qmlRegisterType<Sack>("GameClasses", 1, 0, "Sack");
    qmlRegisterType<CardDistribution>("GameClasses", 1, 0, "CardDistribution");

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));
    if (engine.rootObjects().isEmpty())
        return -1;

//    Player p1, p2;
//    CardDistribution dis;
//    dis.appointCardsToPlayer(&p1);
//    dis.appointCardsToPlayer(&p2);



//    qDebug() << "PLAYER1 CARDS: ";
//    for(Card *card : p1.getCards()) {
//        qDebug() << card->getAllNumbers();
//        CardGeneration::showCard(card);
//        qDebug() << "\n";
//    }

//    qDebug() << "PLAYER2 CARDS: ";
//    for(Card *card : p2.getCards()) {
//        qDebug() << card->getAllNumbers();
//        CardGeneration::showCard(card);
//        qDebug() << "\n";
//    }

    return app.exec();
}
