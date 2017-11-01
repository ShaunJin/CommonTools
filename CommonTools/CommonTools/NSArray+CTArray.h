//
//  NSArray+CTArray.h
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 数组的扩展
#import <Foundation/Foundation.h>

@interface NSArray (CTArray)
/** json字符串转换成数组 */
+(NSArray *)arrayWithJsonString:(NSString *)jsonString;
@end
