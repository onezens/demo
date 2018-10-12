//
//  main.cpp
//  图书管理系统
//
//  Created by wz on 2018/10/12.
//  Copyright © 2018 wz. All rights reserved.
//

/**
 
 功能列表：
 1. 添加书籍
 2. 获取数据 所有的书籍列表
 3. 查询书籍，名字，模糊查询
 4. 修改书籍信息， 可以修改所有录入信息
 5. 退出
 */

#include <iostream>
#include <vector>

using namespace std;

class Book {
public:
    string name;
    int price;
    bool isLent;
    void getInfo(){
        cout << "书名：<<" << name << ">>" << "\t 价格：" << price << "\t 是否借出: " << (isLent ? "借出" : "未借出") << endl;
    }
};

void menu(){
    cout << "功能列表：" << endl;
    cout << " 1. 添加书籍" << endl;
    cout << " 2. 获取数据 所有的书籍列表" << endl;
    cout << " 3. 查询书籍，名字，模糊查询" << endl;
    cout << " 4. 修改书籍信息， 可以修改所有录入信息" << endl;
    cout << " 5. 退出" << endl;
}

void addBook(vector<Book> *books){
    Book book;
    cout << "输入书籍名称： " ;
    string name;
    cin >> name;
    book.name = name;
    
    cout << "输入书籍价格： " ;
    cin >> book.price;
    
    books->push_back(book);
    cout << "添加书籍成功！count: " << books->size() << endl;
    book.getInfo();
    cout << "\n" << endl;
    
}

void getBookList(vector<Book> *books){
    for (int i=0; i<books->size(); i++) {
        Book b = books->at(i);
        b.getInfo();
    }
}

Book* _search(vector<Book> *books, string kw){
    Book *b = nullptr;
    for (int i=0; i<books->size(); i++) {
        Book m = books->at(i);
        if (m.name.find(kw) != -1) {
            b = &m;
            break;
        }
    }
    return b;
}

Book* search(vector<Book> *books){
    string kw;
    cout << "需要查询的关键字： ";
    cin >> kw;
    Book *b = _search(books, kw);
    if (b!=nullptr) {
        b->getInfo();
    }else{
        cout << kw << "没有找到" << endl;
    }
    return b;
}

void update(vector<Book> *books){
    string kw;
    cout << "需要修改书籍的关键字： ";
    cin >> kw;
    Book *b = _search(books, kw);
    if (b!=nullptr) {
        b->getInfo();
        cout << "输入书籍名称： " ;
        cin >> b->name;
        cout << "输入书籍价格： " ;
        cin >> b->price;
        cout << "借出书籍： " ;
        cin >> b->isLent;
    }else{
        cout << kw << "没有找到" << endl;
    }
}

int main(int argc, const char * argv[]) {
    
    vector<Book> books;
    bool isExit = false;
    menu();
    while (!isExit) {
        cout << "输入你要使用的功能： " ;
        int func = 0;
        cin >> func;
        switch (func) {
            case 1:
                addBook(&books);
                break;
            case 2:
                getBookList(&books);
                break;
            case 3:
                search(&books);
                break;
            case 4:
                update(&books);
                break;
            case 5:
                isExit = true;
                break;
            default:
                cout << "未知功能" << endl;
                break;
        }
    }

    return 0;
}
