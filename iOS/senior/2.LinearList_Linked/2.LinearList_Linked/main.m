//
//  main.m
//  2.LinearList_Linked
//
//  Created by wz on 2017/8/22.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinearList.h"

void printListData(LinearList *list) {
    
    NSInteger length = linearListLength(list);
    
    for (int i=0; i<length; i++) {
        LinearListNodeValue *value = linearListGetValue(list, i);
        NSLog(@"%@", value);
    }
    
    NSLog(@"---------------------");
}

int main(int argc, const char * argv[]) {
    
    NSString *str0 = @"0";
    NSString *str1 = @"1";
    NSString *str2 = @"2";
    NSString *str3 = @"3";
    NSString *str4 = @"4";

    LinearList *list = linearListCreate();
    
    linearListUpdateValue(list, (__bridge LinearListNodeValue)str1, 0);

    linearListAddValue(list, (__bridge LinearListNodeValue)str1);
    linearListAddValue(list, (__bridge LinearListNodeValue)str2);
    linearListAddValue(list, (__bridge LinearListNodeValue)str3);
    linearListInsertValue(list,  (__bridge LinearListNodeValue)str3, 0);
    
    printListData(list);
    linearListUpdateValue(list, (__bridge LinearListNodeValue)str4, 2);
    linearListUpdateValue(list, (__bridge LinearListNodeValue)str0, 0);
    
    printListData(list);
    
    linearListPrint(list);
    
    linearListDeleteValue(list, (__bridge LinearListNodeValue)str4);
//    linearListClear(list);
    
    printListData(list);
    linearListAddValue(list, (__bridge LinearListNodeValue)str4);
    linearListInsertValue(list,  (__bridge LinearListNodeValue)str2, 3);
    linearListRemoveValue(list, 3);
    printListData(list);
    
    linearListClear(list);
    printListData(list);
    
    linearListRelease(list);
    
    return 0;
}


