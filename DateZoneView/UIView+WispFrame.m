//
//  UIView+WispFrame.m
//  MagpiePie
//
//  Created by Wisp on 15/11/11.
//  Copyright © 2015年 Yetoon. All rights reserved.
//

#import "UIView+WispFrame.h"

@implementation UIView (WispFrame)

//  返回高度
- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)newheight
{
    CGRect newframe = self.frame;
    newframe.size.height = newheight;
    self.frame = newframe;
}
//  返回宽度
- (CGFloat)width
{
    return self.frame.size.width;
}

//  设置宽度
- (void)setWidth:(CGFloat)newwidth
{
    CGRect newframe = self.frame;
    newframe.size.width = newwidth;
    self.frame = newframe;
}

//  返回Y
- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)newtop
{
    CGRect newframe = self.frame;
    newframe.origin.y = newtop;
    self.frame = newframe;
}

//  返回X
- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat) newleft
{
    CGRect newframe = self.frame;
    newframe.origin.x = newleft;
    self.frame = newframe;
}

//  返回Y + Height
- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)newbottom
{
    CGRect newframe = self.frame;
    newframe.origin.y = newbottom - self.frame.size.height;
    self.frame = newframe;
}

//  返回X + width
- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)newright
{
    CGFloat delta = newright - (self.frame.origin.x + self.frame.size.width);
    CGRect newframe = self.frame;
    newframe.origin.x += delta ;
    self.frame = newframe;
}

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

- (void)setOrigin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)origin
{
    return self.frame.origin;
}

- (void)setSize:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)size
{
    return self.frame.size;
}

- (CGFloat)verticalCentersView:(UIView *)view1 with:(UIView *)view2 {
    return view1.top + (view2.height - view1.height) / 2;
}

- (UIImage *)screenshotWithQuality:(CGFloat)imageQuality {
    // 创建一个基于位图的上下文（context）,并将其设置为当前上下文(context)
    UIGraphicsBeginImageContext(self.bounds.size);
    // 呈现的快照视图层次到当前上下文
    if([self respondsToSelector:@selector(drawViewHierarchyInRect:afterScreenUpdates:)]){
        [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:NO];
    }else{
        [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    }
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    // 压缩比例计算
    NSData *imageData = UIImageJPEGRepresentation(image, imageQuality>0?imageQuality:0.75f);
    image = [UIImage imageWithData:imageData];
    return image;
}

/** 该方法在UIView的分类中实现 */
- (BOOL)isShowingOnKeyWindow
{
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    // 把这个view在它的父控件中的frame(即默认的frame)转换成在window的frame
    CGRect convertFrame = [self.superview convertRect:self.frame toView: keyWindow];
    CGRect windowBounds = keyWindow.bounds;
    // 判断这个控件是否在主窗口上（即该控件和keyWindow有没有交叉）
    BOOL isOnWindow = CGRectIntersectsRect(convertFrame, windowBounds);
    // 再判断这个控件是否真正显示在窗口范围内（是否在窗口上，是否为隐藏，是否透明）
    BOOL isShowingOnWindow = (self.window == keyWindow) && !self.isHidden && (self.alpha > 0.01) && isOnWindow;
    return isShowingOnWindow;
}

@end
