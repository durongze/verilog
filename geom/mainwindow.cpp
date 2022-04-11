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
    x[x.size()] = xs;
    y[y.size()] = ys;
}

void MainWindow::SetGraphic(std::vector<double> &xs, std::vector<double> &ys)
{
    StlUtils<double>::VectorToQVector(x[x.size()], xs);
    StlUtils<double>::VectorToQVector(y[y.size()], ys);
}

void MainWindow::GraphShow()
{
    for (auto idx = ui->customPlot->graphCount(); idx < x.size(); ++idx) {
        ui->customPlot->addGraph();
    }
    for (auto idx = 0; idx < x.size(); ++idx) {
        ui->customPlot->graph(idx)->setData(x[idx], y[idx]);
    }

    QString graphCount = "graphCount:";
    graphCount += QString::fromStdString(std::to_string(ui->customPlot->graphCount()));
    ui->customPlotLabel->setText(graphCount);

    ui->customPlot->replot();
}

void MainWindow::mouseReleaseEvent(QMouseEvent*)
{
    Geom<double> geom;
    geom.ReInit(6);
    std::vector<double> x;
    std::vector<double> y;
    geom.GetVectorX(x);
    geom.GetVectorY(y);
    SetGraphic(x, y);
}
