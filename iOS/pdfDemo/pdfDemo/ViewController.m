//
//  ViewController.m
//  pdfDemo
//
//  Created by wangzhen on 17/4/13.
//  Copyright © 2017年 onezen.cc. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()<UIDocumentInteractionControllerDelegate>
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title=@"预览";
    
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"b.pdf" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    
    UIDocumentInteractionController *documentVc = [UIDocumentInteractionController interactionControllerWithURL:url];
    documentVc.delegate = self;
//    documentVc.
    [documentVc presentPreviewAnimated:YES];
    
}

#pragma mark - UIDocumentInteractionController 代理方法
- (UIViewController *)documentInteractionControllerViewControllerForPreview:(UIDocumentInteractionController *)controller{
    return self;
}

- (UIView *)documentInteractionControllerViewForPreview:(UIDocumentInteractionController *)controller{
    return self.view;
}

- (CGRect)documentInteractionControllerRectForPreview:(UIDocumentInteractionController *)controller{
    return self.view.bounds;
}

@end
