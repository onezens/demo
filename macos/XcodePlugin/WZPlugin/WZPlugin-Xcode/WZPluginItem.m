//
//  WZPluginItem.m
//  WZPlugin-Xcode
//
//  Created by wz on 2017/12/3.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import "WZPluginItem.h"
//#import "XCMutableSourceTextLineArray.h"

@implementation WZPluginItem

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    
//    XCMutableSourceTextLineArray *lineArray = invocation.buffer.lines;
//
//    NSArray *selections = lineArray.selections;
    
    completionHandler(nil);
}

@end
