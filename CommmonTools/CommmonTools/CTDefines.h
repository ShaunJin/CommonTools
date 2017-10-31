//
//  CTDefines.h
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// 宏定义
#ifndef CTDefines
#define CTDefines

/** 判断字符串是否为空*/
#define IsEmptyString(str) (([str isKindOfClass:[NSNull class]] || str == nil || [str length]<=0)? YES : NO )

/** 系统版本*/
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]

//加载本地图片
#define LoadImage(imageName) [UIImage imageNamed:imageName]

// 判断系统版本是否大于某（含）版本
#define IsLaterVersion(version) (([[[UIDevice currentDevice] systemVersion] floatValue] >=version)? (YES):(NO))



#endif
