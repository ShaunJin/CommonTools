//
//  SJBaseAlertView.m
//  CommonTools
//
//  Created by ShaJin on 2017/12/9.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 弹出视图的基类
#import "SJBaseAlertView.h"

@interface SJBaseAlertView()
@property(nonatomic,strong)UIView *backgroungView;
@end
@implementation SJBaseAlertView
#pragma mark- CustomMethod
- (void)setDefaultSettings{
    self.dismissOnTouchOutside = YES;
    self.cornerRadius = 5.0;
    self.isShowShadow = YES;
    // 背景色
    self.backgroundColor = [UIColor whiteColor];
    self.duration = 0.25;
}
-(void)show{
    CGRect oriFrame = self.frame;
    [[UIApplication sharedApplication].keyWindow addSubview:self.backgroungView];
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    switch (_animationType) {
        case kAnimationBottom:{
            self.y = kHeight;
            [UIView animateWithDuration: self.duration animations:^{
                self.frame = oriFrame;
                self.alpha = 1;
                self.backgroungView.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }break;
        default:{
            self.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
            self.alpha = 0;
            [UIView animateWithDuration: self.duration animations:^{
                self.layer.affineTransform = CGAffineTransformMakeScale(1.0, 1.0);
                self.alpha = 1;
                self.backgroungView.alpha = 1;
            } completion:^(BOOL finished) {
                
            }];
        }break;
    }
}
- (void)dismiss{
    switch (_animationType) {
        case kAnimationBottom:{
            [UIView animateWithDuration: self.duration animations:^{
                self.y = kHeight;
                self.backgroungView.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
                [self.backgroungView removeFromSuperview];
            }];
        }break;
        default:{
            [UIView animateWithDuration: self.duration animations:^{
                self.layer.affineTransform = CGAffineTransformMakeScale(0.1, 0.1);
                self.alpha = 0;
                self.backgroungView.alpha = 0;
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
                [self.backgroungView removeFromSuperview];
            }];
        }break;
    }
}
-(void)touchOutSide{
    if (_dismissOnTouchOutside) {
        [self dismiss];
    }
}
#pragma mark- Setter
-(void)setCornerRadius:(CGFloat)cornerRadius{
    if (cornerRadius >= 0) {
        self.radius = cornerRadius;
        _cornerRadius = cornerRadius;
    }
}
- (void)setIsShowShadow:(BOOL)isShowShadow{
    _isShowShadow = isShowShadow;
    self.layer.shadowOpacity = isShowShadow ? 0.5 : 0;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.shadowRadius = isShowShadow ? 2.0 : 0;
}
#pragma mark- Getter
-(UIView *)backgroungView{
    if (!_backgroungView) {
        _backgroungView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWidth, kHeight)];
        _backgroungView.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.2];
        _backgroungView.alpha = 0;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget: self action: @selector(touchOutSide)];
        [_backgroungView addGestureRecognizer: tap];
    }
    return _backgroungView;
}
#pragma mark- 初始化
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setDefaultSettings];
    }
    return self;
}
#pragma mark- 通用弹窗
/** 通用弹窗 */
+(void)tipsWithTitle:(NSString *)title message:(NSString *)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle buttonColor:(UIColor *)buttonColor leftBlock:(void (^)())leftBlock rightBlock:(void (^)())rightBlock{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    if (leftTitle.length > 0) {
        UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            if (leftBlock) {
                leftBlock();
            }
        }];
        [alertController addAction:leftAction];
        if (buttonColor) {
            // 设置按钮文字颜色
            [leftAction setValue:buttonColor forKey:@"titleTextColor"];
        }
    }
    if (rightTitle.length > 0) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            if (rightBlock) {
                rightBlock();
            }
        }];
        [alertController addAction:rightAction];
        if (buttonColor) {
            // 设置按钮文字颜色
            [rightAction setValue:buttonColor forKey:@"titleTextColor"];
        }
    }
    if (leftTitle.length == 0 && rightTitle.length == 0) {
        UIAlertAction *rightAction = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:rightAction];
        if (buttonColor) {
            // 设置按钮文字颜色
            [rightAction setValue:buttonColor forKey:@"titleTextColor"];
        }
    }
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
}
/** 通用弹窗 */
+(void)tipsWithTitle:(NSString *)title message:(NSString *)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle leleftBlock:(void (^)())leftBlock rightBlock:(void (^)())rightBlock{
    [self tipsWithTitle:title message:message leftTitle:leftTitle rightTitle:rightTitle buttonColor:nil leftBlock:leftBlock rightBlock:rightBlock];
}

@end
