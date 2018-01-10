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


    QVector<int> freePositions = { 0, 1, 2, 3, 4, 5, 6, 7, 8};

    QVector<int> placesOnLastLine;

    for (int i(0); i < Card::COLUMNS; i++) {
        if ((*card)[Card::ROWS - 2][i] == 0 && (*card)[Card::ROWS - 3][i] == 0) {
            placesOnLastLine.push_back(i);
            freePositions.removeOne(i);
        }
        else if ((*card)[Card::ROWS - 2][i] != 0 && (*card)[Card::ROWS - 3][i] != 0) {
            freePositions.removeOne(i);
        }
    }
    random_shuffle(freePositions.begin(), freePositions.end());

    while (placesOnLastLine.size() < amountItemInLine) {
        placesOnLastLine.push_back(freePositions.front());
        freePositions.pop_front();
    }
    //The game card has market. Filling it next.

    for(int i(0); i < amountItemInLine; i++){
        int index = placesOnLastLine[i];
        card->operator [](Card::ROWS - 1)[index] = 1; //the cell is marked
    }

    bool firstTime;
    QVector<int> numbers;
    for (int i(0); i < Card::COLUMNS; i++) {
        firstTime = true;

        //if first line - we have 9 values (1-9)
        if(i == 0) {
            numbers.resize(9);
            iota(numbers.begin(), numbers.end(), 1);
        }
        else { //x0-x9
            numbers.resize(10);
            iota(numbers.begin(), numbers.end(), 10 * i);
        }
        if (i == Card::COLUMNS - 1){ //80-90
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


