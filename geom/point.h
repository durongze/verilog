#ifndef POINT_H
#define POINT_H

template<typename T>
class Point
{
public:
    Point(){}
    Point(const T &x, const T& y) : x_(x), y_(y) {}
    void SetX(const T &x) { x_ = x; }
    void SetY(const T &y) { y_ = y; }
    T GetX() const { return x_; }
    T GetY() const { return y_; }
    Point<T> operator=(const Point<T> &other) {
        if (&other != this) {
            x_ = other.x_;
            y_ = other.y_;
        }
        return *this;
    }
private:
    T x_;
    T y_;
};

#endif // POINT_H
