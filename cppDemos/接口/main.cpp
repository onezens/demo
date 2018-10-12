//
//  main.cpp
//  接口
//
//  Created by wz on 2018/10/12.
//  Copyright © 2018 wz. All rights reserved.
//

#include <iostream>
using namespace std;

class Shape {
public:
    virtual float getArea() = 0;
    void setWidth(float w){
        width = w;
    }
    void setHeight(float h){
        height = h;
    }
protected:
    float width;
    float height;
};

class RectAngle: public Shape {
public:
    float getArea() {
        return width * height;
    }
};

class TriAngle: public Shape {
public:
    float getArea() {
        return width * height * 0.5;
    }
};

int main(int argc, const char * argv[]) {
    
    RectAngle rect;
    rect.setWidth(10);
    rect.setHeight(20);
    cout << "RectAngle area: " << rect.getArea() << endl;
    
    TriAngle tri;
    tri.setHeight(5);
    tri.setWidth(9);
    cout << "TriAngle area: " << tri.getArea() << endl;
    
    return 0;
}










