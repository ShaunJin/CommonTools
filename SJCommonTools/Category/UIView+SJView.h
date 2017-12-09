//
//  UIView+SJView.h
//  SJCommonTools
//
//  Created by ShaJin on 2017/11/2.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// UIView的扩展
#import <UIKit/UIKit.h>

@interface UIView (SJView)
/** 控件的X坐标 */
@property(nonatomic,assign)CGFloat x;
/** 控件的Y坐标 */
@property(nonatomic,assign)CGFloat y;
/** 控件的宽度 */
@property(nonatomic,assign)CGFloat w;
/** 控件的高度 */
@property(nonatomic,assign)CGFloat h;
/** 中心点X坐标 */
@property(nonatomic,assign)CGFloat centerX;
/** 中心点Y坐标 */
@property(nonatomic,assign)CGFloat centerY;
/** 设置圆角 */
@property(nonatomic,assign)CGFloat radius;
@end
