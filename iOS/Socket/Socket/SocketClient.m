//
//  SocketClient.m
//  Socket
//
//  Created by wz on 2018/5/10.
//  Copyright © 2018年 cc.onezen. All rights reserved.
//

#import "SocketClient.h"
#import "GCDAsyncSocket.h"

#define SocketServerHost @"127.0.0.1"
#define SocketServerPort 6087

@interface SocketClient()<GCDAsyncSocketDelegate>

@property (nonatomic, strong) GCDAsyncSocket *clientSocket;

@end

@implementation SocketClient

static SocketClient *_client = nil;

+ (instancetype)client {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _client = [[self alloc] init];
    });
    return _client;
}

- (BOOL)connect {
    _clientSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *error = nil;
    BOOL isCon = [_clientSocket connectToHost:SocketServerHost onPort:SocketServerPort error:&error];
//    [_clientSocket enableBackgroundingOnSocket];
    if (error) {
        return false;
    }
    return isCon;
}

- (void)sendTxt:(NSString *)txt;
{
    NSData *data = [txt dataUsingEncoding:NSUTF8StringEncoding];
    [_clientSocket writeData:data withTimeout:-1 tag:0];
}

- (void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"[Client] Connected to %@ %@", host, sock);
    [sock readDataWithTimeout:-1 tag:0];
}


- (void)socketDidDisconnect:(GCDAsyncSocket *)socket withError:(NSError *)error;
{
    NSLog(@"[Client] Closed connection: %@", error);
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag;
{
    NSLog(@"%s", __func__);
    NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"[Client] Received: %@", text);
    text = [text stringByAppendingString:@"\n"];
    [sock readDataWithTimeout:-1 tag:0];
}


@end

