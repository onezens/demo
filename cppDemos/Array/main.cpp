//
//  main.cpp
//  Array
//
//  Created by wz on 2018/5/9.
//  Copyright © 2018年 wz. All rights reserved.
//

#include <iostream>
#include "Array.hpp"
using namespace std;

int main(int argc, const char * argv[]) {

    Array a(10);
    for (int i=0; i<10; i++) {
        a.addData(i, i+10);
    }
    a.addData(10, 10);
    cout << "print array: \n";
    for (int i=0; i<a.length(); i++) {
        cout << "idx:" << i << " value: " << a.getData(i) << "\n";
    }
    
    Array a1 = a;
    
    if (a1 == a) {
        cout << "equal" << endl;
    }else{
        cout << "diff" << endl;
    }
    
    return 0;
}
