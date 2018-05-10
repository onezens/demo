//
//  SocketServer.m
//  Socket
//
//  Created by wz on 2018/5/10.
//  Copyright © 2018年 cc.onezen. All rights reserved.
//

#import "SocketServer.h"
#import "GCDAsyncSocket.h"

#define SocketServerHost @"127.0.0.1"
#define SocketServerPort 6087

@interface SocketServer()<GCDAsyncSocketDelegate>

@property (nonatomic, strong) GCDAsyncSocket *serverSocket;
@property (nonatomic, strong) NSMutableArray *clients;
@end

@implementation SocketServer

static SocketServer *_server = nil;

+ (instancetype)server {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _server = [[self alloc] init];
    });
    return _server;
}


- (BOOL)start {
    _serverSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatch_get_main_queue()];
    NSError *error = nil;
    BOOL isStart = [_serverSocket acceptOnInterface:SocketServerHost port:SocketServerPort error:&error];
//    BOOL isStart = [_serverSocket acceptOnPort:SocketServerPort error:&error];
    if (error) {
        NSLog(@"[Server] Start Error: %@", error);
        return false;
    }
    return isStart;
}


- (void)stop {
    _serverSocket = nil;
}

- (void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket;
{
    NSLog(@"[Server] New connection.");
    [self.clients addObject:newSocket];
    [newSocket readDataWithTimeout:-1 tag:0];
}

- (void)socketDidDisconnect:(GCDAsyncSocket *)socket withError:(NSError *)error;
{
    [_clients removeObject:socket];
    NSLog(@"[Server] Closed connection: %@", error);
}

- (void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag;
{
    NSString *text = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"[Server] Received: %@", text);
    [sock writeData:[@"Hello!" dataUsingEncoding:NSUTF8StringEncoding] withTimeout:-1 tag:0];
    [sock readDataWithTimeout:-1 tag:0];
}

#pragma mark - lazy loading

- (NSMutableArray *)clients {
    if (!_clients) {
        _clients = [NSMutableArray array];
    }
    return _clients;
}

@end
