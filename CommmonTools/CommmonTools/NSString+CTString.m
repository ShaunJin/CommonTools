//
//  NSString+CTString.m
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 字符串的扩展
#import "NSString+CTString.h"
#import "CTDefines.h"
@implementation NSString (CTString)
/** 字典或数组转换成字符串 */
+(NSString *)stringWithJsonData:(id)data{
    NSError *error;
    
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:data options:NSJSONWritingPrettyPrinted error:&error];
    
    NSString *jsonString;
    
    if (!jsonData) {
        
        NSLog(@"%@",error);
        
    }else{
        
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
        
    }

    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    
    NSRange range = {0,jsonString.length};
    
    //去掉字符串中的空格
    
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    
    NSRange range2 = {0,mutStr.length};
    
    //去掉字符串中的换行符
    
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    
    return mutStr;
}
/** 计算单行文字宽度 */
-(CGFloat)widthWithSize:(int)size{
    CGSize theSize;
    NSDictionary *attributes = [NSDictionary dictionaryWithObject:[UIFont systemFontOfSize:size] forKey:NSFontAttributeName];
    theSize = [self sizeWithAttributes:attributes];
    // 向上取整
    return ceil(theSize.width);
}
/** 计算指定宽度文字高度 */
-(CGFloat)heightWithWidth:(CGFloat)width size:(int)size{
    CGRect textRect = [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                         options:NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading
                                      attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:size]}
                                         context:nil];
    return ceil(textRect.size.height);
}
/** 对字符串进行URL编码 */
-(NSString *)URLEncodedString{
    return [self stringByAddingPercentEncodingWithAllowedCharacters:[[NSCharacterSet characterSetWithCharactersInString:@"?!@#$^&%*+,:;='\"`<>()[]{}/\\| "] invertedSet]];;
}
/** 对字符串进行URL解码 */
-(NSString *)URLDecodedString{
    return [self stringByRemovingPercentEncoding];
}
@end
