//
//  LinearList.c
//  2.LinearList_Linked
//
//  Created by wz on 2017/8/22.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#define LINEARLIST_STRUCT

typedef void * LinearListNodeValue;
typedef struct _LinearListNode LinearListNode;

struct _LinearListNode{
    LinearListNodeValue *value;
    LinearListNode *next;
};

typedef struct{
    int length;
    LinearListNode *header;
}LinearList;

#include <stdlib.h>
#include <string.h>
#include "LinearList.h"



/**
 创建线性表对象
 
 @param capacity 初始化容量
 @return  创建的线性表对象
 */
LinearList * linearListCreate() {
    
    LinearList * list = malloc(sizeof(LinearList) + sizeof(LinearListNode));
    
    if (list) {
        list->length = 0;
        list->header = (LinearListNode *)(list+1);
        list->header->next = NULL;
        list->header->value = NULL;
    }
    
    return list;
}


/**
 释放创建好的线性表
 
 @param list 需要释放的线性表
 */
void linearListRelease(LinearList *list) {
    
    if (list == NULL) {
        return;
    }
    
    linearListClear(list);
    
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
    
    LinearListNode *node = list->header;
    node = node->next;
    
    for (int i=0; i<list->length; i++) {
        LinearListNode *next = node->next;
        free(node);
        node = next;
    }
    
    
    list->length = 0;
}


/**
 获取线性表的的元素个数
 */
int linearListLength(LinearList *list) {
    
    if (list == NULL) {
        return 0;
    }
    
    return list->length;
}


/**
 根据index，获取线性表的元素
 */
LinearListNodeValue * linearListGetValue(LinearList *list, int index) {
    
    if (list == NULL || index < 0 || index >= list->length) {
        return NULL;
    }
    
    LinearListNode *node = list->header;
    int currentIdx = 0;
    
    while (node->next != NULL) {
        node = node->next;
        if (currentIdx == index) {
            break;
        }
        currentIdx++;
        
    }
    return node->value;
}


/**
 移除索引为index的元素
 */
void linearListRemoveValue(LinearList *list, int index) {
    
    if (list == NULL || index < 0 || index >= list->length) {
        return ;
    }
    
    LinearListNode *node = list->header;
    if(node->next == NULL) return;
    int currentIdx = 0;
    
    while (node->next != NULL) {
        if (currentIdx == index-1) {
            break;
        }
        currentIdx++;
        node = node->next;
    }
    LinearListNode *currentNode = node->next;
    node->next = currentNode->next;
    free(currentNode);
    list->length = list->length-1;
}

/**
 在index处插入一个新的元素
 */
void linearListInsertValue(LinearList *list, LinearListNodeValue *value, int index) {
    
    if (list == NULL || index < 0 || index > list->length) {
        return ;
    }
    
    LinearListNode *preNode = list->header;
    int currentIdx = 0;
    
    while (preNode->next != NULL) {
        
        if (currentIdx == index) {
            break;
        }
        preNode = preNode->next;
        currentIdx++;
        
    }
    LinearListNode *newNode = malloc(sizeof(LinearListNode));
    newNode->value = value;
    newNode->next = preNode->next;
    preNode->next = newNode;
    list->length = list->length+1;
}

/**
 添加新元素
 */
void linearListAddValue(LinearList *list, LinearListNodeValue *value) {
    
    if (list == NULL || value == NULL) {
        return;
    }
    
    linearListInsertValue(list, value, list->length);
}

/**
 删除元素
 */
void linearListDeleteValue(LinearList *list, LinearListNodeValue *value) {
    
    if (list ==NULL || value==NULL || list->length == 0) {
        return;
    }
    
    LinearListNode *node = list->header;
    LinearListNode *preNode = node;
    while (node->next != NULL) {
        if (node->value == value) {
            break;
        }
        preNode = node;
        node = node->next;
    }
    preNode->next = node->next;
    free(node);
    list->length = list->length-1;
}

/**
 修改索引的index的元素
 */
void linearListUpdateValue(LinearList *list, LinearListNodeValue *value, int index) {
    
    if (list->length == 0) {
        linearListInsertValue(list, value, 0);
        return;
    }
    if (list==NULL || index<0 || index >= list->length || value == NULL) {
        return;
    }

    LinearListNode *node = list->header;
    int currentIdx = 0;
    while (node->next != NULL) {
        node = node->next;
        if (currentIdx == index) {
            break;
        }
        currentIdx++;
    }
    
    node->value = value;

}

/**
 输出线性表的所有内容
 */
void linearListPrint(LinearList *list) {
    
    if (list == NULL) return;
    printf("list{\n");
    printf("\tlength = %d;\n",list->length);
    printf("\tvalue = [");
    //拿出头节点
    LinearListNode * currentNode = list->header;
    for (int i = 0; i < list->length; i++) {
        currentNode = currentNode->next;
        printf("%p",currentNode->value);
        if (i < list->length -1) {
            printf(",");
        }
    }
    printf("];\n}\n\n");
}
