//
//  LinearList.h
//  1.LinearList
//
//  Created by wz on 2017/8/21.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#ifndef LinearList_h
#define LinearList_h

#include <stdio.h>

typedef void * LinearListNodeValue;


/**
 线性表结构
 */
typedef struct {
    int capacity; //容量
    int length;  //元素个数
    LinearListNodeValue * nodeValue; //节点指针
}LinearList;

/**
创建线性表对象

@param capacity 初始化容量
@return  创建的线性表对象
*/
LinearList * linearListCreate(int capacity) ;


/**
 释放创建好的线性表
 
 @param list 需要释放的线性表
 */
void linearListRelease(LinearList *list);


/**
 清空线性表种所有的数据
 
 @param list 需要清空的的线性表
 */
void linearListClear(LinearList *list);


/**
 获取线性表的的元素个数
 */
int linearListLength(LinearList *list);


/**
 根据index，获取线性表的元素
 */
LinearListNodeValue * linearListGetValue(LinearList *list, int index);


/**
 移除索引为index的元素
 */
void linearListRemoveValue(LinearList *list, int index);

/**
 在index处插入一个新的元素
 */
void linearListInsertValue(LinearList *list, LinearListNodeValue *value, int index);

/**
 添加新元素
 */
void linearListAddValue(LinearList *list, LinearListNodeValue *value);

/**
 删除元素
 */
void linearListDeleteValue(LinearList *list, LinearListNodeValue *value);

/**
 修改索引的index的元素
 */
void linearListUpdateValue(LinearList *list, LinearListNodeValue *value, int index);

/**
 输出线性表的所有内容
 */
void linearListPrint(LinearList *list);


#endif /* LinearList_h */
