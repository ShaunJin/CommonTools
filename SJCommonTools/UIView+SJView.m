//
//  UIView+SJView.m
//  SJCommonTools
//
//  Created by ShaJin on 2017/11/2.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// UIView的扩展
#import "UIView+SJView.h"

@implementation UIView (SJView)
#pragma Setter
-(void)setFrameX:(CGFloat)frameX{
    self.frame = CGRectMake(frameX, self.frameY, self.frameW, self.frameH);
}
-(void)setFrameY:(CGFloat)frameY{
    self.frame = CGRectMake(self.frameX, frameY, self.frameW, self.frameH);
}
-(void)setFrameW:(CGFloat)frameW{
    self.frame = CGRectMake(self.frameX, self.frameY, frameW, self.frameH);
}
-(void)setFrameH:(CGFloat)frameH{
    self.frame = CGRectMake(self.frameX, self.frameY, self.frameW, frameH);
}
-(void)setCenterX:(CGFloat)centerX{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}
-(void)setCenterY:(CGFloat)centerY{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}
-(void)setRadius:(CGFloat)radius{
    self.layer.cornerRadius = radius;
    self.layer.masksToBounds = YES;
}
#pragma Getter
-(CGFloat)frameX{
    return self.frame.origin.x;
}
-(CGFloat)frameY{
    return self.frame.origin.y;
}
-(CGFloat)frameW{
    return self.frame.size.width;
}
-(CGFloat)frameH{
    return self.frame.size.height;
}
-(CGFloat)centerX{
    return self.center.x;
}
-(CGFloat)centerY{
    return self.center.y;
}
-(CGFloat)radius{
    return self.layer.cornerRadius;
}


/**
 *  计算一个view相对于屏幕(去除顶部statusbar的20像素)的坐标
 *  iOS7下UIViewController.view是默认全屏的，要把这20像素考虑进去
 */
+ (CGRect)relativeFrameForScreenWithView:(UIView *)v
{
    BOOL iOS7 = [[[UIDevice currentDevice] systemVersion] floatValue] >= 7;
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    if (!iOS7) {
        screenHeight -= 20;
    }
    UIView *view = v;
    CGFloat x = .0;
    CGFloat y = .0;
    while (view.frame.size.width != 320 || view.frame.size.height != screenHeight) {
        x += view.frame.origin.x;
        y += view.frame.origin.y;
        view = view.superview;
        if ([view isKindOfClass:[UIScrollView class]]) {
            x -= ((UIScrollView *) view).contentOffset.x;
            y -= ((UIScrollView *) view).contentOffset.y;
        }
    }
    return CGRectMake(x, y, v.frame.size.width, v.frame.size.height);
}
// 获取view相对于屏幕的坐标。有方法的:
// CGRect frame = [view convertRect:view.bounds toView:nil];
@end
