//
//  ViewController.m
//  BackgroundUploadTask
//
//  Created by wz on 2017/11/20.
//  Copyright © 2017年 cc.onezen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<NSURLSessionDelegate>

@property (nonatomic, strong) NSURLSession *backgroundSession;
@property (nonatomic, strong) NSURLSessionUploadTask *uploadTask;

@end
#define boundary @"----WebKitFormBoundaryFoBXvlPSGohXlI5z"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     self.backgroundSession = [self getDownloadURLSession];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self bgUpload];
}
- (void)bgUpload{
   
    NSURL *url = [NSURL URLWithString:@"http://localhost:3004/upload/stream"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"icon" ofType:@"jpg"];
    self.uploadTask = [self.backgroundSession uploadTaskWithRequest:request fromFile:[NSURL fileURLWithPath:path]];
    [self.uploadTask resume];
}

-(void)upload {

    NSURL *url = [NSURL URLWithString:@"http://localhost/upload"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"swagger-api=s%3A9ePi-4wGuhkUaNySuxduosVG0oq-T1oc.3gHlSd5WMYFXNdljAa%2FldopiBRFmXwO9DyGga4DBwD0" forHTTPHeaderField:@"Cookie"];
    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; charset=utf-8;boundary=%@",boundary];
    [request setValue:contentType forHTTPHeaderField:@"Content-Type"];
    NSString *path = [[NSBundle mainBundle]pathForResource:@"icon" ofType:@"jpg"];
    NSData *bodydata = [self buildBodyDataWithStatus:@"赞" withPicPath:path];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionUploadTask *task = [session uploadTaskWithRequest:request fromData:bodydata completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //打印出响应体，查看是否发送成功
        NSLog(@"response = %@",response);
        
    }];
    [task resume];
  
}


-(NSData*)buildBodyDataWithStatus:(NSString*)text withPicPath:(NSString *)path{
    NSMutableData *bodyData = [NSMutableData data];
    //创建可变字符串
    NSMutableString *bodyStr = [NSMutableString string];
    
    //1 access_token
    [bodyStr appendFormat:@"--%@\r\n",boundary];//\n:换行 \n:切换到行首
    [bodyStr appendFormat:@"Content-Disposition: form-data; name=\"avatar\"; filename=\"icon.jpg\""];
    [bodyStr appendFormat:@"\r\n\r\n"];
    
    
    NSData *start = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:start];
    NSData *picData = [NSData dataWithContentsOfFile:path];
    [bodyData appendData:picData];


    bodyStr = [NSMutableString string];
    [bodyStr appendFormat:@"--%@\r\n",boundary];
//    [bodyStr appendFormat:@"\r\n\r\n"];
    [bodyStr appendFormat:@"--%@\r\n",boundary];//\n:换行 \n:切换到行首
    [bodyStr appendFormat:@"Content-Disposition: form-data; name=\"username\""];
    [bodyStr appendFormat:@"\r\n\r\n"];
    [bodyStr appendFormat:@"%@\r\n",text];
    [bodyStr appendFormat:@"--%@\r\n",boundary];
    
    NSData *endData = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    [bodyData appendData:endData];
    
    
    
    return bodyData;
    
    
}

- (NSURLSession *)getDownloadURLSession {
    
    NSURLSession *session = nil;
    NSString *identifier = [self backgroundSessionIdentifier];
    NSURLSessionConfiguration* sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:identifier];
    sessionConfig.timeoutIntervalForResource = 24*60*60;
    session = [NSURLSession sessionWithConfiguration:sessionConfig
                                            delegate:self
                                       delegateQueue:[NSOperationQueue mainQueue]];
    return session;
}

- (NSString *)backgroundSessionIdentifier {
    NSString *bundleId = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleIdentifier"];
    NSString *identifier = [NSString stringWithFormat:@"%@.BackgroundSession", bundleId];
    return identifier;
}


#pragma mark - nsurlsession delegate


/* The last message a session receives.  A session will only become
 * invalid because of a systemic error or when it has been
 * explicitly invalidated, in which case the error parameter will be nil.
 */
- (void)URLSession:(NSURLSession *)session didBecomeInvalidWithError:(nullable NSError *)error {
    NSLog(@"%s", __func__);
}

/* If implemented, when a connection level authentication challenge
 * has occurred, this delegate will be given the opportunity to
 * provide authentication credentials to the underlying
 * connection. Some types of authentication will apply to more than
 * one request on a given connection to a server (SSL Server Trust
 * challenges).  If this delegate message is not implemented, the
 * behavior will be to use the default handling, which may involve user
 * interaction.
 */
- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge
 completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition disposition, NSURLCredential * _Nullable credential))completionHandler{
    NSLog(@"%s", __func__);
}

/* If an application has received an
 * -application:handleEventsForBackgroundURLSession:completionHandler:
 * message, the session delegate will receive this message to indicate
 * that all messages previously enqueued for this session have been
 * delivered.  At this time it is safe to invoke the previously stored
 * completion handler, or to begin any internal updates that will
 * result in invoking the completion handler.
 */
- (void)URLSessionDidFinishEventsForBackgroundURLSession:(NSURLSession *)session {
    NSLog(@"%s", __func__);
}



- (void)URLSession:(NSURLSession *)session
      downloadTask:(NSURLSessionDownloadTask *)downloadTask
 didResumeAtOffset:(int64_t)fileOffset
expectedTotalBytes:(int64_t)expectedTotalBytes {
    
    NSLog(@"fileOffset:%lld expectedTotalBytes:%lld",fileOffset,expectedTotalBytes);
}



- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
willPerformHTTPRedirection:(NSHTTPURLResponse *)response
        newRequest:(NSURLRequest *)request
 completionHandler:(void (^)(NSURLRequest * _Nullable))completionHandler {
    
    //NSLog(@"willPerformHTTPRedirection ------> %@",response);
    NSLog(@"%s", __func__);
}

/* The task has received a response and no further messages will be
 * received until the completion block is called. The disposition
 * allows you to cancel a request or to turn a data task into a
 * download task. This delegate message is optional - if you do not
 * implement it, you can get the response as a property of the task.
 *
 * This method will not be called for background upload tasks (which cannot be converted to download tasks).
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler{
    NSLog(@"%s", __func__);
}

/* Notification that a data task has become a download task.  No
 * future messages will be sent to the data task.
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didBecomeDownloadTask:(NSURLSessionDownloadTask *)downloadTask{
    NSLog(@"%s", __func__);
}

/*
 * Notification that a data task has become a bidirectional stream
 * task.  No future messages will be sent to the data task.  The newly
 * created streamTask will carry the original request and response as
 * properties.
 *
 * For requests that were pipelined, the stream object will only allow
 * reading, and the object will immediately issue a
 * -URLSession:writeClosedForStream:.  Pipelining can be disabled for
 * all requests in a session, or by the NSURLRequest
 * HTTPShouldUsePipelining property.
 *
 * The underlying connection is no longer considered part of the HTTP
 * connection cache and won't count against the total number of
 * connections per host.
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didBecomeStreamTask:(NSURLSessionStreamTask *)streamTask{
    NSLog(@"%s", __func__);
}

/* Sent when data is available for the delegate to consume.  It is
 * assumed that the delegate will retain and not copy the data.  As
 * the data may be discontiguous, you should use
 * [NSData enumerateByteRangesUsingBlock:] to access it.
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
    didReceiveData:(NSData *)data{
    NSLog(@"%s", __func__);
}

/* Invoke the completion routine with a valid NSCachedURLResponse to
 * allow the resulting data to be cached, or pass nil to prevent
 * caching. Note that there is no guarantee that caching will be
 * attempted for a given resource, and you should not rely on this
 * message to receive the resource data.
 */
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
 willCacheResponse:(NSCachedURLResponse *)proposedResponse
 completionHandler:(void (^)(NSCachedURLResponse * _Nullable cachedResponse))completionHandler{
    NSLog(@"%s", __func__);
}



@end
