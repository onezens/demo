//
//  SocketClient.h
//  Socket
//
//  Created by wz on 2018/5/10.
//  Copyright © 2018年 cc.onezen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SocketClient : NSObject

+ (instancetype)client;

- (BOOL)connect;

- (void)sendTxt:(NSString *)txt;
@end
