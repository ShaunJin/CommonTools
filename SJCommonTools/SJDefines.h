//
//  SJDefines.h
//  SJCommonTools
//
//  Created by ShaJin on 2017/11/2.
//  Copyright © 2017年 ShaJin. All rights reserved.
//

#ifndef SJDefines_h
#define SJDefines_h

/** 判断字符串是否为空 */
#define IsEmptyString(str) (([str isKindOfClass:[NSNull class]] || str == nil || [str length]<=0)? YES : NO )

/** 系统版本 */
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

/** 加载本地图片 */
#define LoadImage(imageName) [UIImage imageNamed:imageName]

/** 判断系统版本是否大于某（含）版本 */
#define IsLaterVersion(version) (([[[UIDevice currentDevice] systemVersion] floatValue] >=version)? (YES):(NO))

/** 屏幕宽高*/
#define KWidth [UIScreen mainScreen].bounds.size.width
#define KHeight [UIScreen mainScreen].bounds.size.height

/** 颜色 */
#define Color(R, G, B) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define ColorA(r, g, b, a) ([UIColor colorWithRed:(r / 255.0) green:(g / 255.0) blue:(b / 255.0) alpha:a])

/** 16进制数值颜色 */ // 调用 ：HEXRGB(0XFFFF)
#define HEXRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#endif /* SJDefines_h */
