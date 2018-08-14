//
//  UIView+WispFrame.h
//  MagpiePie
//
//  Created by Wisp on 15/11/11.
//  Copyright © 2015年 Yetoon. All rights reserved.
//

#import <UIKit/UIKit.h>

static const CGFloat iPad3HiFi = 2048.f;
static const CGFloat iPad3Width = 1024.f;

#define kScreenW [UIScreen mainScreen].bounds.size.width
#define kFit(x) ((x) / (iPad3Width) * (kScreenW))
#define kImg(x) ((x) / (iPad3HiFi) * (iPad3Width))
#define kImgFit(x) ((x) / (iPad3HiFi) * (iPad3Width) / (iPad3Width) * (kScreenW))

#define UIColorFromHex(hexValue)        UIColorFromHexA(hexValue, 1.0f)
#define UIColorFromHexA(hexValue, a)     [UIColor colorWithRed:(((hexValue & 0xFF0000) >> 16))/255.0f green:(((hexValue & 0xFF00) >> 8))/255.0f blue:((hexValue & 0xFF))/255.0f alpha:a]

#define kCSMTipFont28 [UIFont systemFontOfSize:kImgFit(28)]
#define kCSM444444TextColor UIColorFromHex(0x444444)

#ifndef weakify
#if DEBUG
#if __has_feature(objc_arc)
#define weakify(object) autoreleasepool{} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) autoreleasepool{} __block __typeof__(object) block##_##object = object;
#endif
#else
#if __has_feature(objc_arc)
#define weakify(object) try{} @finally{} {} __weak __typeof__(object) weak##_##object = object;
#else
#define weakify(object) try{} @finally{} {} __block __typeof__(object) block##_##object = object;
#endif
#endif
#endif

#ifndef strongify
#if DEBUG
#if __has_feature(objc_arc)
#define strongify(object) autoreleasepool{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) autoreleasepool{} __typeof__(object) object = block##_##object;
#endif
#else
#if __has_feature(objc_arc)
#define strongify(object) try{} @finally{} __typeof__(object) object = weak##_##object;
#else
#define strongify(object) try{} @finally{} __typeof__(object) object = block##_##object;
#endif
#endif
#endif

@interface UIView (WispFrame)

//  高度
@property (nonatomic,assign) CGFloat height;
//  宽度
@property (nonatomic,assign) CGFloat width;

//  Y
@property (nonatomic,assign) CGFloat top;
//  X
@property (nonatomic,assign) CGFloat left;

//  Y + Height
@property (nonatomic,assign) CGFloat bottom;
//  X + width
@property (nonatomic,assign) CGFloat right;

@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// 水平
- (CGFloat)verticalCentersView:(UIView *)view1 with:(UIView *)view2;
// 截图
- (UIImage *)screenshotWithQuality:(CGFloat)imageQuality;
//判断这个控件是否真正显示在窗口范围内（是否在窗口上，是否为隐藏，是否透明）
- (BOOL)isShowingOnKeyWindow;

@end
