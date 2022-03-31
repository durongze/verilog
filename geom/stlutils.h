#ifndef STLUTILS_H
#define STLUTILS_H

#include <QVector>

template<typename T>
class StlUtils
{
public:
    StlUtils() {}
    static void VectorToQVector(QVector<T> &qv, const std::vector<T> &v) {
        qv.resize(v.size());
        for (auto i = 0; i < v.size(); ++i) {
            qv[i] = v[i];
        }
    }
};

#endif // STLUTILS_H
