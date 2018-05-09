//
//  Array.hpp
//  Array
//
//  Created by wz on 2018/5/9.
//  Copyright © 2018年 wz. All rights reserved.
//

#ifndef Array_hpp
#define Array_hpp

#include <stdio.h>

class Array{
public:
    Array(int length);
    Array(const Array& arr);
    ~Array(); //析构函数
public:
    void addData(int idx, int val);
    int getData(int idx);
    int length();
private:
    int m_length;
    int *m_space;
public:
    int& operator[](int i);
    
    //重载
    Array& operator = (Array &a);
    bool operator == (Array &a);
    bool operator != (Array &a);
    
};



#endif /* Array_hpp */
