//
//  DateZoneView.h
//  SZCalendarPicker
//
//  Created by xush on 2018/7/4.
//  Copyright © 2018年 Stephen Zhuang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SZCalendarPicker.h"

@interface DateZoneView : UIView

@property (nonatomic , strong) UIView *mask;

@property (nonatomic, strong) SZCalendarPicker *beginPicker;
@property (nonatomic, strong) SZCalendarPicker *endPicker;
@property (nonatomic, strong) UIButton *confirmBtn;
@property (nonatomic, strong) UIButton *cancelBtn;

@property (nonatomic, strong) UILabel *qishiLab;
@property (nonatomic, strong) UILabel *jiezhiLab;
@property (nonatomic, strong) UILabel *beginLab;
@property (nonatomic, strong) UILabel *endLab;
@property (nonatomic, strong) UILabel *toLab;

@property (nonatomic, strong) NSString *beginStr;
@property (nonatomic, strong) NSString *endStr;

+ (instancetype)showOnView:(UIView *)view;
- (void)hide;

@end
