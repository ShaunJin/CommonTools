//
//  CommmonTools.h
//  CommmonTools
//
//  Created by ShaJin on 2017/10/28.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CommmonTools : NSObject

/*
 ---------------------------
 丨        title           丨
 丨       message          丨
 丨                        丨
 丨leftTitle    rightTtitle丨
 丨                        丨
 ---------------------------
 */
/** 通用弹窗 */
+(void)tipsWithTitle:(NSString *)title message:(NSString *)message leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle leftBlock:(void(^)())leftBlock rightBlock:(void(^)())rightBlock;
@end
