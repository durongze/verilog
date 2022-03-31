#include "mainwindow.h"
#include "ui_mainwindow.h"
#include "stlutils.h"
#include "geom.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    QTimer *t = new QTimer(this);
    t->start(500);
    connect(t, SIGNAL(timeout()), this, SLOT(GraphShow()));
    connect(ui->customPlot, SIGNAL(mouseRelease(QMouseEvent*)), this, SLOT(mouseReleaseEvent(QMouseEvent*)));
    ui->customPlot->addGraph();
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::SetGraphic(QVector<double> &xs, QVector<double> &ys)
{
    x = xs;
    y = ys;
}

void MainWindow::SetGraphic(std::vector<double> &xs, std::vector<double> &ys)
{
    StlUtils<double>::VectorToQVector(x, xs);
    StlUtils<double>::VectorToQVector(y, ys);
}

void MainWindow::GraphShow()
{
    ui->customPlot->graph(0)->setData(x,y);
    ui->customPlot->replot();
}

void MainWindow::mouseReleaseEvent(QMouseEvent*)
{

}
