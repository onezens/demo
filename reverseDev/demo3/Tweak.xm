#import<UIKit/UIKit.h>
#import<CoreLocation/CoreLocation.h>
#import<CoreLocation/CLLocation.h>
#import "fishhook.h"

@interface SeePeopleNearByLogicController
- (void)onRetrieveLocationOK:(id)arg1;
@end

static int (*orig_close)(int);
static int (*orig_open)(const char *, int, ...);

int my_close(int fd) {
    printf("Calling real close(%d)\n", fd);
    return orig_close(fd);
}

int my_open(const char *path, int oflag, ...) {
    va_list ap = {0};
    mode_t mode = 0;

    if ((oflag & O_CREAT) != 0) {
        // mode only applies to O_CREAT
        va_start(ap, oflag);
        mode = va_arg(ap, int);
        va_end(ap);
        NSLog(@"Calling real open('%s', %d, %d)", path, oflag, mode);
        return orig_open(path, oflag, mode);
    } else {
        NSLog(@"Calling real open('%s', %d)", path, oflag);
        return orig_open(path, oflag, mode);
    }
}

%hook MicroMessengerAppDelegate
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions 
{
    struct rebinding rbd[2];
    rbd[0].name = "close";
    rbd[0].replacement = (void*)my_close;
    rbd[0].replaced = (void**)&orig_close;

    rbd[1].name = "open";
    rbd[1].replacement = (void*)my_open;
    rbd[1].replaced = (void**)&orig_open;

    rebind_symbols(rbd, 2);
    NSLog(@"begin hook");
    return %orig;
}
%end

%hook SeePeopleNearByLogicController
- (void)onRetrieveLocationOK:(id)arg1
{
    CLLocation *location = [[CLLocation alloc] initWithLatitude:31.154352 longitude:121.42562];
    %orig(location);

    UIAlertView *alertView = [[UIAlertView alloc] 
    initWithTitle:[@"onRetrieveLocationOK" 
    stringByAppendingString:[[NSString alloc] 
    initWithFormat:@"location is %@", location]] 
    message:nil 
    delegate:self 
    cancelButtonTitle:@"ok" 
    otherButtonTitles:nil];

    [alertView show];

}
%end