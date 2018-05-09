//
//  Array.cpp
//  Array
//
//  Created by wz on 2018/5/9.
//  Copyright © 2018年 wz. All rights reserved.
//

#include "Array.hpp"


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






