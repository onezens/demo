//
//  main.cpp
//  信号处理
//
//  Created by wz on 2018/10/12.
//  Copyright © 2018 wz. All rights reserved.
//

#include <iostream>
#include <csignal>
#include <unistd.h>
using namespace std;

void signalHanlder(int code){
    cout << "Recevied signal code: " << code << endl;
    exit(code);
}

int main(int argc, const char * argv[]) {
    
    signal(SIGINT, signalHanlder);
    while (1) {
        cout << "sleep ...." << endl;
        sleep(1);
    }

    return 0;
}
