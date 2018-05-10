//
//  SocketServer.h
//  Socket
//
//  Created by wz on 2018/5/10.
//  Copyright © 2018年 cc.onezen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketServer : NSObject

+ (instancetype)server;

- (BOOL)start;

- (void)stop;

@end
