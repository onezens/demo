//
//  PreviewViewController.m
//  pdfDemo
//
//  Created by wangzhen on 17/4/13.
//  Copyright © 2017年 onezen.cc. All rights reserved.
//

#import "PreviewViewController.h"
#import <QuickLook/QuickLook.h>

@interface PreviewViewController ()<QLPreviewControllerDataSource, QLPreviewControllerDelegate>
@property (nonatomic, strong) NSURL *fileUrl;
@end

@implementation PreviewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title=@"预览";
    self.view.backgroundColor = [UIColor whiteColor];
    
  }


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    NSString *urlStr = [[NSBundle mainBundle] pathForResource:@"a.pdf" ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:urlStr];
    self.fileUrl = url;
    
    if ([QLPreviewController canPreviewItem:(id<QLPreviewItem>)url]) {
        QLPreviewController *qlVc = [[QLPreviewController alloc] init];
        qlVc.view.frame = CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64);
        qlVc.delegate = self;
        qlVc.dataSource = self;
        qlVc.navigationController.navigationBar.userInteractionEnabled = YES;
        qlVc.view.userInteractionEnabled = YES;
        [self.view addSubview:qlVc.view];
        qlVc.view.backgroundColor = [UIColor whiteColor];
////        [self.navigationController pushViewController:qlVc animated:true];
//        for (UIView *view in qlVc.view.subviews) {
//            view.backgroundColor = [UIColor orangeColor];
//        }
        qlVc.view.layer.backgroundColor = [UIColor orangeColor].CGColor;
    }

}

#pragma mark - QLPreviewController 代理方法
- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller{
    return 1;
}

- (id<QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index{
    return self.fileUrl;
}

- (UIImage *)previewController:(QLPreviewController *)controller transitionImageForPreviewItem:(id <QLPreviewItem>)item contentRect:(CGRect *)contentRect {
    return [UIImage imageNamed:@"1"];
}


@end
