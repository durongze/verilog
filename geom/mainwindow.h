#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QMap>
#include <QVector>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();
    void SetGraphic(QVector<double> &xs, QVector<double> &ys);
    void SetGraphic(std::vector<double> &xs, std::vector<double> &ys);
public slots:
    void GraphShow();
    void mouseReleaseEvent(QMouseEvent*);
private:
    Ui::MainWindow *ui;
    QMap<int, QVector<double> > x;
    QMap<int, QVector<double> > y;
};
#endif // MAINWINDOW_H
