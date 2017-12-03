//
//  SourceEditorCommand.m
//  WZPlugin-Xcode
//
//  Created by wz on 2017/12/2.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import "SourceEditorCommand.h"

@implementation SourceEditorCommand

- (void)performCommandWithInvocation:(XCSourceEditorCommandInvocation *)invocation completionHandler:(void (^)(NSError * _Nullable nilOrError))completionHandler
{
    //headerDict存放文本中所有的头文件
    NSMutableDictionary <NSString*, NSNumber *>*headerDict = [NSMutableDictionary dictionary];
    //willCheckDict存放将要删除的头文件
    NSMutableDictionary <NSNumber*, NSString *>*willCheckDict = [NSMutableDictionary dictionary];
    
    //遍历编辑器每一行
    for (int idx = 0; idx < invocation.buffer.lines.count; idx++) {
        
        NSString *lineCode = invocation.buffer.lines[idx];
        
        //若willCheckDict文件不为空，则进行是否使用了该头文件的判断
        if (willCheckDict.count > 0) {
            [willCheckDict enumerateKeysAndObjectsUsingBlock:^(NSNumber * _Nonnull key, NSString * _Nonnull checkString, BOOL * _Nonnull stop) {
                if ([lineCode containsString:checkString]) {
                    if (![lineCode containsString:@"#import"]) {
                        if ([headerDict[checkString] isEqualToNumber: @1]) {
                            //若使用了该头文件，则从willCheckDict字典中提出该项
                            [willCheckDict removeObjectForKey:key];
                            //同时设置该头文件已经检查过，若后续仍出现该头文件，则可以进行删除
                            headerDict[checkString] = @0;
                        }
                    }
                }
            }];
            
        }
        
        //检测代码是否含有#import为头文件标志；+号我们认为是类扩展的标志
        if ([lineCode containsString:@"#import"] && ![lineCode containsString:@"+"]) {
            //解析获取类名
            NSRange range1 = [lineCode rangeOfString:@"\""];
            NSRange range2 = [lineCode rangeOfString:@"\"" options:NSBackwardsSearch];
            NSRange zeroRange = NSMakeRange(0, 0);
            
            if (!(NSEqualRanges(range1, zeroRange) || NSEqualRanges(range2, zeroRange))) {
                NSRange findRange = NSMakeRange(range1.location + 1, range2.location - range1.location - 3);
                NSString *classString = [lineCode substringWithRange:findRange];
                willCheckDict[@(idx)] = classString;
                headerDict[classString] = @1;
            }
        }
    }
    
    
    //取出需要删除的行
    NSMutableIndexSet *index = [NSMutableIndexSet indexSet];
    [willCheckDict.allKeys enumerateObjectsUsingBlock:^(NSNumber * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [index addIndex:obj.integerValue];
        
    }];
    
    //删除不符合条件的行
    [invocation.buffer.lines removeObjectsAtIndexes:index];
    
    //通知系统完成
    completionHandler(nil);}

@end
