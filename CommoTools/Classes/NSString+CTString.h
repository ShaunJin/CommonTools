//
//  NSString+CTString.h
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 字符串的扩展
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface NSString (CTString)
/** 字典或数组转换成字符串 */
+(NSString *)stringWithJsonData:(id)data;
/** 计算单行文字宽度 */
-(CGFloat)widthWithSize:(int)size;
/** 计算指定宽度文字高度 */
-(CGFloat)heightWithWidth:(CGFloat)width size:(int)size;
/** 对字符串进行URL编码 */
-(NSString *)URLEncodedString;
/** 对字符串进行URL解码 */
-(NSString *)URLDecodedString;
@end
