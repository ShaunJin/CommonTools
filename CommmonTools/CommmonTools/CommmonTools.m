//
//  CommmonTools.m
//  CommmonTools
//
//  Created by ShaJin on 2017/10/28.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import "CommmonTools.h"
#import <UIKit/UIKit.h>
@implementation CommmonTools
/** 通用弹窗 */
+(void)tipsWithTitle:(NSString *)title message:(NSString *)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle leftBlock:(void(^)())leftBlock rightBlock:(void(^)())rightBlock{
    if (leftTitle.length > 0 || rightTitle.length > 0) {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
        if (leftTitle.length > 0) {
            UIAlertAction *leftAction = [UIAlertAction actionWithTitle:leftTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
                if (leftBlock) {
                    leftBlock();
                }
            }];
            [alertController addAction:leftAction];
            // 设置按钮文字颜色
            [leftAction setValue:[UIColor colorWithRed:8 / 255.0 green:169 / 255.0 blue:90 / 255.0 alpha:1.0] forKey:@"titleTextColor"];
        }
        if (rightTitle.length > 0) {
            UIAlertAction *rightAction = [UIAlertAction actionWithTitle:rightTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                if (rightBlock) {
                    rightBlock();
                }
            }];
            [alertController addAction:rightAction];
            // 设置按钮文字颜色
            [rightAction setValue:[UIColor colorWithRed:8 / 255.0 green:169 / 255.0 blue:90 / 255.0 alpha:1.0] forKey:@"titleTextColor"];
        }
        [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:alertController animated:YES completion:nil];
    }
}
@end
