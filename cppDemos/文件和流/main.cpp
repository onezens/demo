//
//  main.cpp
//  文件和流
//
//  Created by wz on 2018/10/12.
//  Copyright © 2018 wz. All rights reserved.
//

#include <iostream>
#include <fstream>
using namespace std;

void copyFile(const char * srcPath, const char * dstPath){
    ofstream outfile;
    ifstream infile;
    
    infile.open(srcPath);
    outfile.open(dstPath);
    
    cout << "copy file: " << srcPath << " to path: " << dstPath << endl;
    
    char data[100];
    infile >> data;
    while (!infile.eof()) {
        cout << data << endl;
        outfile << data << endl;
        infile >> data;
    }
    
    infile.close();
    outfile.close();
}

int main(int argc, const char * argv[]) {

    char data[100];
    const char * filePath = "/Users/wz/Desktop/1.txt";
    
    ofstream outfile;
    outfile.open(filePath);
    cout << "Personal info record:" << endl;
    cout << "Enter your name: " << endl;
    cin.getline(data, 100);
    // write data
    outfile << data << endl;
    
    cout << "Enter your age: " << endl;
    cin >> data;
    cin.ignore();
    outfile << data << endl;
    
    //close file
    outfile.close();
    
    
    //read mode open file
    ifstream infile;
    infile.open(filePath);
    cout << "\nGet info from record: " << endl;
    infile >> data;
    cout << data << endl;
    
    infile >> data;
    cout << data << endl;
    
    infile.close();
    
    copyFile(filePath, "/Users/wz/Desktop/2.txt");
    
    return 0;
}
