#ifndef GEOM_H
#define GEOM_H

#include <vector>
#include "point.h"

template<typename T>
class Geom
{
public:
    Geom(){}
    void Init(int num) {
        ps_.resize(num);
        for (auto i = 0; i < num; i++) {
            ps_[i] = Point<T>(i, i);
        }
    }
    void ReInit(int num) {
        ps_.resize(num);
        static int x = 0;
        ++x;
        for (auto i = 0; i < num; i++) {
            ps_[i] = Point<T>(x, i);
        }
    }
    int GetVectorX(std::vector<T> &x) const {
        x.resize(ps_.size());
        for (auto i = 0; i < ps_.size(); ++i) {
            x[i] = ps_.at(i).GetX();
        }
        return x.size();
    }
    int GetVectorY(std::vector<T> &y) const {
        y.resize(ps_.size());
        for (auto i = 0; i < ps_.size(); ++i) {
            y[i] = ps_.at(i).GetY();
        }
        return y.size();
    }
private:
    std::vector<Point<T> > ps_;
};

#endif // GEOM_H
