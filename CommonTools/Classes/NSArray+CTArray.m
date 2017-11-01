//
//  NSArray+CTArray.m
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 数组的扩展
#import "NSArray+CTArray.h"

@implementation NSArray (CTArray)
/** json字符串转换成数组 */
+(NSArray *)arrayWithJsonString:(NSString *)jsonString{
    if (jsonString) {
        NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error = nil;
        NSArray *array = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
        if (error) {
            NSLog(@"json解析失败 ： %@",error);
        }else{
            return array;
        }
    }
    return nil;
}
@end
