//
//  CTMethods.m
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 通用方法
#import "CTMethods.h"
#import <UIKit/UIKit.h>
@implementation CTMethods
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
