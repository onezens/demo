//
//  main.cpp
//  泛型-模板
//
//  Created by wz on 2018/10/12.
//  Copyright © 2018 wz. All rights reserved.
//

#include <iostream>
#include <vector>
#include <cstdlib>
#include <string>
#include <stdexcept>
using namespace std;

template <class T>
class Stack {
private:
    vector<T> st;
public:
    void push(T const&);
    void pop();
    T top() const;
    bool empty(){
        return st.empty();
    }
};

template <class T>
void Stack<T>::push(T const& ele){
    st.push_back(ele);
}

template <class T>
void Stack<T>::pop() {
    if (st.empty()) {
        throw out_of_range("Stack::pop() out of range");
    }
    st.pop_back();
}

template <class T>
T Stack<T>::top() const{
    if (st.empty()) {
        throw out_of_range("Stack::pop() out of range");
    }
    return  st.back();
}




int main(int argc, const char * argv[]) {

    try {
        Stack<int> st1;
        Stack<string> st2;
        
        st1.push(10);
        cout << st1.top() << endl;
        st1.pop();
        
        st2.push("xiaoming");
        cout << st2.top() << endl;
        st2.pop();
        st2.pop();
    } catch (exception ex) {
        cerr << "Exception: " << ex.what() << endl;
        return 1;
    }
    
    return 0;
}














