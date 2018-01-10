#include "cardgeneration.h"
#include <QDebug>
#include <QTime>
#include <QThread>
#include <iostream>
#include <qalgorithms.h>

using namespace std;

int CardGeneration::countGeneration;

CardGeneration::CardGeneration()
{
    countGeneration = QTime::currentTime().msec();
    //qDebug() << "CardGeneration";

}

Card *CardGeneration::getNewCard()
{
    //qDebug() << "getNewCard";

    //     qsrand(uint(QTime::currentTime().msec()));
    qsrand(countGeneration++);

    //QVector<int> locatingInRow = { 0, 1, 2, 3, 4, 5, 6, 7, 8};
    QVector<int> positionsInFirstLine(5);
    QVector<int> positionsInSecondLine(5);
    Card *card = new Card();
    positionsInFirstLine = getPositionsForLine();
    positionsInSecondLine = getPositionsForLine();
    while (comparePositionsOnLines(positionsInFirstLine, positionsInSecondLine)) {
        positionsInSecondLine = getPositionsForLine();
    }

    int amountItemInLine = 5;

    int index = 0;
    for (int j(0); j < amountItemInLine; j++) {
        index = positionsInFirstLine[j]; //find needed place for number
        card->operator[](0)[index] = 1; //the cell is marked
    }

    index = 0;
    for (int j(0); j < amountItemInLine; j++) {
            index = positionsInSecondLine[j]; //find needed place for number
            card->operator[](1)[index] = 1; //the cell is marked
    }


    QVector<int> placesOnLastLine;
    for (int i(0); i < Card::COLUMNS; i++) {
        if ((*card)[Card::ROWS - 2][i] == 0 && (*card)[Card::ROWS - 3][i] == 0) {
            //placesOnLastLine.insert(placesOnLastLine.begin(), i);
            placesOnLastLine.push_back(i);
        }
        else if ((*card)[Card::ROWS - 2][i] == 0 || (*card)[Card::ROWS - 3][i] == 0){
            placesOnLastLine.push_back(i);
        }
    }
    shuffle_(placesOnLastLine, 4, placesOnLastLine.size() - 1);

    for(int i(0); i < 5; i++){
//        qDebug() << i << placesOnLastLine.size();
        int index = placesOnLastLine[i];
//        qDebug() << "OK";
        card->operator [](Card::ROWS - 1)[index] = 1; //the cell is marked
    }
    //The game card has market. Filling it next.

    bool firstTime;
    QVector<int> numbers;
    for (int i(0); i < Card::COLUMNS; i++) {
        firstTime = true;
        numbers.resize(10);
        iota(numbers.begin(), numbers.end(), 10 * i);
        //        for (int k(0); k < 10; k++){
        //            numbers[k] += k;
        //        }
        if (i == Card::COLUMNS - 1){
            numbers.push_back(90);
        }
        shuffle_(numbers);
        //qDebug() << numbers;

        int index = 0;
        for (int j(0); j < Card::ROWS; j++){
            //if cell is marked
            if ((*card)[j][i] == 1){
                index = (firstTime) ? 0 : (qrand() % (Card::COLUMNS - 1)) + 1;
                (*card)[j][i] = numbers[index];
                firstTime = false;
            }

        }
        firstTime = true;
        numbers.clear();
    }
    //showCard(card);
    //    Card *res = new Card();
    //    res->setNumbers(card);
    //qDebug() << "END";
    return card;
}


void CardGeneration::showCard(Card *card)
{
    QString str;
    for(int i(0); i < Card::ROWS; i++) {
        for(int j(0); j < Card::COLUMNS; j++) {
            if ((*card)[i][j] != 0){
                str += QString::asprintf(" %2d", (*card)[i][j]);
            }
            else{
                str += "   ";
            }
        }
        str += "\n";
    }
    QStringList lines = str.split("\n");
    qDebug().noquote() << lines[0];
    qDebug().noquote() << lines[1];
    qDebug().noquote() << lines[2];
}

void CardGeneration::shuffle_(QVector<int>& arr, int firstI, int lastI)
{
    //    qsrand(uint(QTime::currentTime().msec()));

    qsrand(countGeneration++);
    int repeatTimes = 250;
    for (int i(0); i < repeatTimes; i++){
        int firstIndex = qrand() % lastI;

        int secondIndex = qrand() % lastI;
        swap(arr[firstIndex], arr[secondIndex]);
    }

}

QVector<int> CardGeneration::getPositionsForLine()
{
    QVector<int> locatingInRow = { 0, 1, 2, 3, 4, 5, 6, 7, 8};
    shuffle_(locatingInRow);
    locatingInRow.resize(5);

    return locatingInRow;
}

bool CardGeneration::comparePositionsOnLines(QVector<int> v1, QVector<int> v2)
{
    sort(v1.begin(), v1.end());
    sort(v2.begin(), v2.end());

    return v1 == v2;
}


