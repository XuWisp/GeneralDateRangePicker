//
//  UILabel+XSHLabel.m
//  MagpiePie
//
//  Created by Wisp on 16/2/22.
//  Copyright © 2016年 徐沙洪. All rights reserved.
//

#import "UILabel+WispLabel.h"

@implementation UILabel (WispLabel)

+ (UILabel *)commonLabelWithFrame:(CGRect)frame
                             text:(NSString*)text
                            color:(UIColor*)color
                             font:(UIFont*)font
                    textAlignment:(NSTextAlignment)textAlignment
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = text;
    label.textColor = color;
    label.font = font;
    label.textAlignment = textAlignment;
    
    label.backgroundColor = [UIColor clearColor];
    
    return label;
}

//动态设置Label的高度
+ (UILabel *)dynamicHeightLabelWithPointX:(CGFloat)pointX
                                   pointY:(CGFloat)pointY
                                    width:(CGFloat)width
                               strContent:(NSString *)strContent
                                    color:(UIColor *)color
                                     font:(UIFont *)font
                            textAlignmeng:(NSTextAlignment)textAlignmeng
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle.copy};
    
    CGSize labelSize =
    [strContent boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                             options:NSStringDrawingUsesLineFragmentOrigin
                          attributes:attributes
                             context:nil].size;
    
    UILabel *myLabel = [[UILabel alloc] initWithFrame:CGRectMake(pointX, pointY, width, labelSize.height)];
    [myLabel setNumberOfLines:0];
    myLabel.text = strContent;
    myLabel.font = font;
    myLabel.textColor = color;
    return myLabel;
}

//调整文本中的行距的方法
- (void)getlable_height:(NSString *)text uiheight:(NSInteger)height uilable:(UILabel*)name
{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    [paragraphStyle setLineSpacing:height];//调整行间距
    
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [text length])];
    name.attributedText = attributedString;
    
}

//自适应size设置
- (CGSize)sizeWithMaxSize:(CGSize)size {
    CGRect rect = [self.text boundingRectWithSize:size //限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin //采用换行模式
                                    attributes:@{NSFontAttributeName:self.font} //传入字体
                                       context:nil];
    return rect.size;
}
// 使用 苹方 字体
- (void)setPFFont {
    self.font = [UIFont fontWithName:@"PingFangSC-Regular" size:17.f];
}

+ (void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
}

@end
