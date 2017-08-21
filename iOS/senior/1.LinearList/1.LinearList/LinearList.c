//
//  LinearList.c
//  1.LinearList
//
//  Created by wz on 2017/8/21.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#include "LinearList.h"

#include <string.h>
#include <stdlib.h>


/**
 创建线性表对象
 
 @param capacity 初始化容量
 @return  创建的线性表对象
 */
LinearList * linearListCreate(int capacity)  {
    
    if (capacity < 0) {
        return NULL;
    }
    
    LinearList *list = malloc(sizeof(LinearList));
    
    if (list) {
        list -> capacity = capacity;
        list -> length = 0;
        list -> nodeValue = capacity ? malloc(sizeof(LinearListNodeValue) * capacity) : NULL;
    }
    
    return list;
}


/**
 释放创建好的线性表
 
 @param list 需要释放的线性表
 */
void linearListRelease(LinearList *list) {
    
    if (list == NULL) return;
    
    free(list->nodeValue);
    free(list);
}


/**
 清空线性表种所有的数据
 
 @param list 需要清空的的线性表
 */
void linearListClear(LinearList *list) {
    
    if (list == NULL) {
        return;
    }
    list->length = 0;
    
}


/**
 获取线性表的的元素个数
 */
int linearListLength(LinearList *list) {
    
    if(list == NULL) return 0;
    
    return list->length;
}


/**
 根据index，获取线性表的元素
 */
LinearListNodeValue *  linearListGetValue(LinearList *list, int index) {
    
    if(list == NULL || index < 0 || index >= list->length) return NULL;
    
    return list->nodeValue[index];
    
}


/**
 移除索引为index的元素
 */
void linearListRemoveValue(LinearList *list, int index) {
    
    if(list == NULL || index < 0 || index >= list->length) return ;
    
    for (int i=index; i<list->length-1; i++) {
        list->nodeValue[index] = list->nodeValue[index+1];
    }
    
    list->length = list->length - 1;
    
}

/**
 在index处插入一个新的元素
 */
void linearListInsertValue(LinearList *list, LinearListNodeValue *value, int index) {
    
    if(list == NULL || index < 0 || index >= list->length) return ;
    
    
    //判断是否需要扩容
    if(list->length == list->capacity){
        
        //新的容量
        int newCapacity = list->capacity + 10;
        
        //新的节点指针
        LinearListNodeValue *newValue = malloc(sizeof(LinearListNodeValue) * newCapacity);
        
        if(newValue == NULL) return;
        
        //复制
        memcpy(newValue, list->nodeValue, sizeof(LinearListNodeValue) * list->capacity);
        
        free(list->nodeValue);
        //更新list
        list->nodeValue = newValue;
        list->capacity = newCapacity;
        
    }
    
    list->length = list->length+1;
    
    for (int i=list->length-1; i>index; i--) {
        list->nodeValue[i] = list->nodeValue[i-1];
    }
    
    list->nodeValue = value;
    
    
}

/**
 添加新元素
 */
void linearListAddValue(LinearList *list, LinearListNodeValue *value) {
    
    linearListInsertValue(list, value, list->length);
}

/**
 删除元素
 */
void linearListDeleteValue(LinearList *list, LinearListNodeValue *value) {
    
    if (list == NULL || value == NULL) {
        return;
    }
    
    int index = -1;
    for (int i=0; i<list->length; i++) {
        if (list->nodeValue[i] == value) {
            index = i;
            break;
        }
    }
    
    linearListRemoveValue(list, index);
    
    
}

/**
 修改索引的index的元素
 */
void linearListUpdateValue(LinearList *list, LinearListNodeValue *value, int index) {
    
    if(list == NULL || index < 0 || index >= list->length) return ;
    
    
    list->nodeValue[index] = value;
}

/**
 输出线性表的所有内容
 */
void linearListPrint(LinearList *list) {
    
    if (list == NULL) {
        return;
    }
    printf("list{\n");
    printf("\tlength = %d;\n",list->length);
    printf("\tcapacity = %d;\n",list->capacity);
    printf("\tvalue = [");
    for (int i = 0; i < list->length; i++) {
        printf("%p",list->nodeValue[i]);
        if (i < list->length -1) {
            printf(",");
        }
    }
    printf("];\n\t}\n\n");
}
