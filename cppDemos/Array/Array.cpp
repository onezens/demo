//
//  Array.cpp
//  Array
//
//  Created by wz on 2018/5/9.
//  Copyright © 2018年 wz. All rights reserved.
//

#include "Array.hpp"
#include <iostream>
using namespace std;

Array::Array(int length){
    if (length<0) {
        length=0;
    }
    m_length = length;
    m_space = new int[m_length];
}

Array::Array(const Array &arr){
    
    this->m_length = arr.m_length;
    this->m_space = new int[m_length];
    for (int i=0; i<m_length; i++) {
        this->m_space[i] = arr.m_space[i];
    }
}

Array::~Array(){
    if(m_space != NULL){
        delete [] m_space;
        m_space = NULL;
        m_length = -1;
    }
    cout << "dealloc" << endl;
}

void Array::addData(int idx, int val){
    m_space[idx] = val;
}

int Array::getData(int idx){
    return m_space[idx];
}

int Array::length(){
    return m_length;
}

int& Array::operator[](int i){
    return m_space[i];
}

Array& Array::operator=(Array &a){
    if (this->m_space != NULL) {
        delete [] m_space;
        m_length = 0;
    }
    m_length = a.m_length;
    m_space = new int[m_length];
    
    for (int i=0; i<m_length; i++) {
        m_space[i] = a.m_space[i];
    }
    return *this;
}

bool Array::operator==(Array &a){
    if (this->m_length != a.m_length) {
        return false;
    }
    for (int i=0; i<m_length; i++) {
        if (this->m_space[i] != a.m_space[i]) {
            return false;
        }
    }
    return true;
}

bool Array::operator!=(Array &a){
    return !(*this == a);
}
