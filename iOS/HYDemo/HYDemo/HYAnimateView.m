//
//  HYAnimateView.m
//  HYDemo
//
//  Created by 莫名 on 2019/11/20.
//  Copyright © 2019 莫名. All rights reserved.
//

#import "HYAnimateView.h"

@interface HYAnimateView() <CAAnimationDelegate>
@property (nonatomic, assign) CGRect targetRect;
@end

@implementation HYAnimateView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.targetRect = CGRectMake(20, 100, frame.size.width-40, 200);
        self.image = [UIImage imageNamed:@"mingren.jpg"];
        self.userInteractionEnabled = YES;
    }
    return self;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self dismiss];
}

- (void)dismiss {
    UIBezierPath *startPath = [[UIBezierPath alloc] init];
    [startPath moveToPoint:CGPointMake(0, 0)];
    [startPath addLineToPoint:CGPointMake(self.frame.size.width, 0)];
    [startPath addLineToPoint:CGPointMake(self.frame.size.width, self.frame.size.height)];
    [startPath addLineToPoint:CGPointMake(0, self.frame.size.height)];
    [startPath closePath];
    
    UIBezierPath *finalPath = [[UIBezierPath alloc] init];
    [finalPath moveToPoint:CGPointMake(self.targetRect.origin.x, self.targetRect.origin.y)];
    [finalPath addLineToPoint:CGPointMake(self.targetRect.origin.x + self.targetRect.size.width, self.targetRect.origin.y)];
    [finalPath addLineToPoint:CGPointMake(self.targetRect.origin.x + self.targetRect.size.width, self.targetRect.origin.y + self.targetRect.size.height)];
    [finalPath addLineToPoint:CGPointMake(self.targetRect.origin.x, self.targetRect.origin.y + self.targetRect.size.height)];
    [finalPath closePath];
    
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.path = startPath.CGPath;
    self.layer.mask = maskLayer;

    CABasicAnimation *maskLayerAnimation = [CABasicAnimation animationWithKeyPath:@"path"];
    maskLayerAnimation.fromValue = (__bridge id)(startPath.CGPath);
    maskLayerAnimation.toValue = (__bridge id)((finalPath.CGPath));
    maskLayerAnimation.duration = 1;
    maskLayerAnimation.timingFunction = [CAMediaTimingFunction  functionWithName:kCAMediaTimingFunctionDefault];
    maskLayerAnimation.delegate = self;
    maskLayerAnimation.autoreverses = false;
    maskLayerAnimation.removedOnCompletion = false;
    maskLayerAnimation.fillMode = kCAFillModeForwards;
    [maskLayer addAnimation:maskLayerAnimation forKey:@"path"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    //[self removeFromSuperview];
    //self.frame = CGRectMake(20, 100, frame.size.width-40, 160);
    CGFloat width = self.frame.size.width;
    self.superview.clipsToBounds = true;
    self.superview.frame = CGRectMake(20, 100, width-40, 200);
    self.frame = CGRectMake(-20, -100, width, self.frame.size.height);
}

@end
