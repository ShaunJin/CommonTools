//
//  CTMethods.h
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 通用方法
#import <Foundation/Foundation.h>
@class UIColor;
@interface CTMethods : NSObject
/*
 ---------------------------
 丨        title           丨
 丨       message          丨
 丨                        丨
 丨leftTitle    rightTtitle丨
 丨                        丨
 ---------------------------
 */
/** 通用弹窗 可以设置颜色 */
+(void)tipsWithTitle:(NSString *)title message:(NSString *)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle buttonColor:(UIColor *)buttonColor leftBlock:(void(^)())leftBlock rightBlock:(void(^)())rightBlock;

/** 通用弹窗 无颜色 */
+(void)tipsWithTitle:(NSString *)title message:(NSString *)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle leleftBlock:(void (^)())leftBlock rightBlock:(void (^)())rightBlock;
@end
