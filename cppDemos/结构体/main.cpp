//
//  main.cpp
//  结构体
//
//  Created by wz on 2018/10/11.
//  Copyright © 2018 wz. All rights reserved.
//

#include <iostream>
using namespace std;

struct People {
    char name[20];
    char character[20];
    char job[20];
    int age;
};
void logInfo(struct People p);

int main(int argc, const char * argv[]) {
    
    People xm;
    People xf;
    
    strcpy(xm.name, "xiaoming");
    strcpy(xm.character, "play football, computer, coding");
    strcpy(xm.job, "soft enginner");
    xm.age = 23;
    logInfo(xm);
    
    strcpy(xf.name, "xiaofang");
    strcpy(xf.character, "helpful");
    strcpy(xf.job, "HRBP");
    xf.age = 18;
    logInfo(xf);

    return 0;
}

void logInfo(struct People p){
    
    cout << "name: "  << p.name << endl;
    cout << "character: " << p.character << endl;
    cout << "job: " << p.job << endl;
    cout << "age: " << p.age << endl;
}






