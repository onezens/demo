//
//  ViewController.m
//  jsDemo
//
//  Created by wz on 2018/6/27.
//  Copyright © 2018年 wz. All rights reserved.
//

#import "ViewController.h"
#import <WebKit/WebKit.h>

@interface ViewController ()

@property (nonatomic, strong) UIWebView *webView;
@property (nonatomic, strong) WKWebView *wkWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadWKWebView];
}

- (void)loadWKWebView {
    WKWebView *webView = [[WKWebView alloc] initWithFrame:self.view.bounds];
    NSURL *url = [NSURL URLWithString:@"http://localhost/1.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView loadRequest:request];
//    [webView evaluateJavaScript:@"function say(){ alert('say Hello11!'); }; " completionHandler:^(id _Nullable obj, NSError * _Nullable error) {
//        NSLog(@"obj: %@ error: %@", obj, error);
//    }];
    [self.view addSubview:webView];
    self.wkWebView = webView;
}

- (void)loadWebView {
    
    NSURL *url = [NSURL URLWithString:@"http://localhost/1.html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    UIWebView *webview = [[UIWebView alloc] initWithFrame:self.view.bounds];
    [webview loadRequest:request];
    [webview stringByEvaluatingJavaScriptFromString:@"function say(){ alert('say Hello111!'); }"];
    [self.view addSubview:webview];
    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.wkWebView evaluateJavaScript:@"function say(){ alert('say Hello111!'); }" completionHandler:^(id _Nullable obj, NSError * _Nullable error) {
        NSLog(@"obj: %@ error: %@", obj, error);
    }];
}







@end
