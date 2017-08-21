//
//  main.m
//  1.LinearList
//
//  Created by wz on 2017/8/21.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinearList.h"

int main(int argc, const char * argv[]) {

    
    NSString *str1 = @"123";
    NSString *str2 = @"456";
    NSString *str3 = @"789";

    LinearList *list = linearListCreate(3);
    
    linearListAddValue(list, (__bridge LinearListNodeValue)str1);
    
    linearListPrint(list);
    
    linearListInsertValue(list, (__bridge LinearListNodeValue)str2, 0);
    
    linearListInsertValue(list, (__bridge LinearListNodeValue)str3, 0);
    
    linearListInsertValue(list, (__bridge LinearListNodeValue)str3, list->length);
    
    linearListPrint(list);
    
    linearListRemoveValue(list, 2);
    
    linearListClear(list);
    
    
    linearListPrint(list);
    
    linearListInsertValue(list, (__bridge LinearListNodeValue)str2, 0);
    
    linearListInsertValue(list, (__bridge LinearListNodeValue)str3, 0);
    
    linearListInsertValue(list, (__bridge LinearListNodeValue)str3, list->length);
    
    linearListPrint(list);
    
    linearListDeleteValue(list, (__bridge LinearListNodeValue)str3);
    
    linearListPrint(list);
    
    NSLog(@"length: %d", linearListLength(list));
    
    
    linearListUpdateValue(list, (__bridge LinearListNodeValue)str1, 0);
    linearListPrint(list);
    
    LinearListNodeValue *value = linearListGetValue(list, 0);
    
    NSLog(@"%@",value);
    
    linearListRelease(list);
    
    
    return 0;
}
