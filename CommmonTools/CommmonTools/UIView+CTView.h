//
//  UIView+CTView.h
//  CommmonTools
//
//  Created by ShaJin on 2017/10/31.
//  Copyright © 2017年 ShaJin. All rights reserved.
//
// UIView的扩展
#import <UIKit/UIKit.h>

@interface UIView (CTView)
/** 控件的X坐标 */
@property(nonatomic,assign)CGFloat frameX;
/** 控件的Y坐标 */
@property(nonatomic,assign)CGFloat frameY;
/** 控件的宽度 */
@property(nonatomic,assign)CGFloat frameW;
/** 控件的高度 */
@property(nonatomic,assign)CGFloat frameH;
/** 中心点X坐标 */
@property(nonatomic,assign)CGFloat centerX;
/** 中心点Y坐标 */
@property(nonatomic,assign)CGFloat centerY;
/** 设置圆角 */
@property(nonatomic,assign)CGFloat radius;
@end
