//
//  UILabel+XSHLabel.h
//  MagpiePie
//
//  Created by Wisp on 16/2/22.
//  Copyright © 2016年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (WispLabel)

+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                             text:(NSString*)text
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment;

/**
 *  创建一个动态高度的UILabel
 *
 *  @param pointX        Label的横坐标
 *  @param pointY        Label的纵坐标
 *  @param width         Label的宽度
 *  @param strContent    内容
 *  @param color         字体颜色
 *  @param font          字体大小
 *  @param textAlignmeng 对齐方式
 *
 *  @return 返回一个UILabel
 */
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                               strContent:(NSString *)strContent
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng;

//调整文本中的行距的方法
/*使用方法
 *
 *text参数 ：文本内容
 *
 *height参数：行距
 *
 *name 参数：你使用的 UIlable 对象
 */
- (void) getlable_height:(NSString *)text uiheight:(NSInteger)height uilable:(UILabel*)name;

//自适应size设置
- (CGSize)sizeWithMaxSize:(CGSize)size;

// 使用 苹方 字体
- (void)setPFFont;

/**
 *  改变行间距
 */
+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

@end
