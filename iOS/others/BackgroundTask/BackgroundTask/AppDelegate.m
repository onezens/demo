//
//  AppDelegate.m
//  BackgroundTask
//
//  Created by wangzhen on 17/3/11.
//  Copyright © 2017年 onezen.cc. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) NSInteger totalTime;
@property (nonatomic, assign) UIBackgroundTaskIdentifier backgroundTask;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    //    [application setMinimumBackgroundFetchInterval:UIApplicationBackgroundFetchIntervalMinimum];
    NSDictionary* pushNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
    {
        [[UIApplication sharedApplication]
         registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound |
                                                                                        UIUserNotificationTypeAlert |
                                                                                        UIUserNotificationTypeBadge) categories:nil]];
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
    
    [self showAlertWithMsg:[[pushNotification valueForKey:@"aps"] valueForKey:@"alert"]];
    
    return YES;
}

- (void)showAlertWithMsg:(NSString *)msg {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:msg message:nil delegate:nil cancelButtonTitle:@"confirm" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
}

//启动背景模式的任务， 时间为3分钟
- (void)setUpBackgroundTask:(UIApplication *)application{
    [self runTimer];
    self.backgroundTask = [application beginBackgroundTaskWithName:@"bg1" expirationHandler:^{
        [self invalidateTimer];
        [application endBackgroundTask:self.backgroundTask];
        self.backgroundTask = UIBackgroundTaskInvalid;
    }];
}


//UIBackgroundMode RemotePushNotification
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo fetchCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
    NSLog(@"%@", userInfo);
    NSString *msg =[[userInfo valueForKey:@"aps"] valueForKey:@"alert"];
    msg = [msg stringByAppendingString:@"   hahahahah"];
    [self showAlertWithMsg:msg];
    
}


- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    NSString *deviceTokenStr= [NSString stringWithFormat:@"%@", [deviceToken description]];
    NSString *tokenStr = [deviceTokenStr stringByReplacingOccurrencesOfString:@" " withString:@""];
    tokenStr = [tokenStr stringByReplacingOccurrencesOfString:@"<" withString:@""];
    tokenStr = [tokenStr stringByReplacingOccurrencesOfString:@">" withString:@""];
    NSLog(@"%@", tokenStr);
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - custorm event


- (void)runTimer {
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:true block:^(NSTimer * _Nonnull timer) {
        self.totalTime += self.timer.timeInterval;
        NSLog(@"timer runing........ totalTime: %d application: %f", self.totalTime, [UIApplication sharedApplication].backgroundTimeRemaining);
    }];
    [self.timer fire];
    
}

- (void)invalidateTimer {
    [self.timer invalidate];
    self.timer = nil;
    NSLog(@"timer runing stoped!!!!!!!!!!!!!! totalTime: %d", self.totalTime);
}


@end
