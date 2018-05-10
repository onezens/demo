//
//  main.m
//  Socket
//
//  Created by wz on 2018/5/10.
//  Copyright © 2018年 cc.onezen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SocketServer.h"
#import "SocketClient.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        if([[SocketServer server] start]){
            if([[SocketClient client] connect]){
                NSLog(@"connected!!!");
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    [[SocketClient client] sendTxt:@"Hi!"];
                    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                        [[SocketClient client] sendTxt:@"Hi...!"];
                    });
                });
            }
        }
    }
    [[NSRunLoop currentRunLoop] run];
    return 0;
}
