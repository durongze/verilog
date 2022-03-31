#include "mainwindow.h"

#include <QApplication>
#include "geom.h"

int main(int argc, char *argv[])
{
    QApplication a(argc, argv);
    MainWindow w;
    Geom<double> geom;
    geom.Init(5);
    std::vector<double> x;
    std::vector<double> y;
    geom.GetVectorX(x);
    geom.GetVectorY(y);
    w.SetGraphic(x, y);
    w.show();
    return a.exec();
}
