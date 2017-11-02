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
@end
