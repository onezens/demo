//
//  ViewController.m
//  HYDemo
//
//  Created by 莫名 on 2019/11/20.
//  Copyright © 2019 莫名. All rights reserved.
//

#import "ViewController.h"
#import "HYAnimateView.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *targetView;
@property (nonatomic, strong) HYAnimateView *animateView;
@property (nonatomic, strong) UIView *contentView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor cyanColor];
    self.contentView = [UIView new];
    self.contentView.frame = self.view.bounds;
    [self.view addSubview:self.contentView];
    [self.contentView addSubview:self.animateView];
//    [self.view addSubview:self.animateView];
}

- (UIView *)targetView {
    if (!_targetView) {
        _targetView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 160)];
        _targetView.backgroundColor = [UIColor redColor];
    }
    return _targetView;
}

- (HYAnimateView *)animateView {
    if (!_animateView) {
        _animateView = [[HYAnimateView alloc] initWithFrame:self.view.bounds];
    }
    return _animateView;
}


@end
