//
//  SJMethods.m
//  SJCommonTools
//
//  Created by ShaJin on 2017/11/2.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 通用方法
#import "SJMethods.h"
#import <UIKit/UIKit.h>
@implementation SJMethods
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
/** 在主线程执行的任务 */
+(void)actionWithMainQueue:(void (^)())action{
    dispatch_async(dispatch_get_main_queue(), ^{
        action();
    });
}
/** 在多线程执行的任务 */
+(void)actionWithGlobalQueue:(void(^)())action{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        action();
    });
}
@end
