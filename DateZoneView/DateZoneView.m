//
//  DateZoneView.m
//  SZCalendarPicker
//
//  Created by xush on 2018/7/4.
//  Copyright © 2018年 Stephen Zhuang. All rights reserved.
//

#import "DateZoneView.h"
#import "UIView+WispFrame.h"
#import "UILabel+WispLabel.h"

@implementation DateZoneView

#pragma mark - Life Cycle

+ (instancetype)showOnView:(UIView *)view
{
    DateZoneView *dzView = [[DateZoneView alloc] initWithFrame:(CGRectMake(kImgFit(20), kImgFit(200), view.frame.size.width-kImgFit(20*2), 352+kImgFit(150)))];
    dzView.mask = [[UIView alloc] initWithFrame:view.bounds];
    dzView.mask.backgroundColor = [UIColor blackColor];
    dzView.mask.alpha = 0.3;
    [view addSubview:dzView.mask];
    [view addSubview:dzView];
    return dzView;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.beginPicker];
    [self addSubview:self.endPicker];
    UIView *lineV = [[UIView alloc] initWithFrame:(CGRectMake(self.beginPicker.right, 0, kImgFit(2), self.beginPicker.height))];
    lineV.backgroundColor = [UIColor orangeColor];
    [self addSubview:lineV];
    [self addSubview:self.toLab];
    [self addSubview:self.qishiLab];
    [self addSubview:self.jiezhiLab];
    [self addSubview:self.beginLab];
    [self addSubview:self.endLab];
//    [self addSubview:self.cancelBtn];
    [self addSubview:self.confirmBtn];
//    @weakify(self)
//    self.endPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
//        @strongify(self)
//        NSLog(@"%zi-%zi-%zi", year,month,day);
//        self.beginPicker.today = self.endPicker.date;
//    };
    @weakify(self)
    _beginPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
        @strongify(self)
        self.beginLab.text = [NSString stringWithFormat:@"%ld/%02ld/%02ld", (long)year,(long)month,(long)day];
    };
    _endPicker.calendarBlock = ^(NSInteger day, NSInteger month, NSInteger year){
        @strongify(self)
        self.endLab.text = [NSString stringWithFormat:@"%ld/%02ld/%02ld", (long)year,(long)month,(long)day];
    };
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self addTap];
    [self show];
}


#pragma mark - Lazy load

- (SZCalendarPicker *)beginPicker {
    if (!_beginPicker) {
        _beginPicker = [SZCalendarPicker showOnView:self];
        _beginPicker.today = [NSDate date];
        _beginPicker.date = _beginPicker.today;
        _beginPicker.frame = CGRectMake(0, 0, (self.frame.size.width-kImgFit(2))/2, 352);
    }
    return _beginPicker;
}

- (SZCalendarPicker *)endPicker {
    if (!_endPicker) {
        _endPicker = [SZCalendarPicker showOnView:self];
        _endPicker.today = [NSDate date];
        _endPicker.date = _endPicker.today;
        _endPicker.frame = CGRectMake(self.frame.size.width/2+kImgFit(1), 0, self.frame.size.width/2-kImgFit(1), 352);
    }
    return _endPicker;
}

- (UILabel *)qishiLab {
    if (!_qishiLab) {
        _qishiLab = [UILabel commonLabelWithFrame:(CGRectMake(0, self.endPicker.bottom, self.frame.size.width/2, kImgFit(50)))
                                             text:@"起始日期" color:kCSM444444TextColor font:kCSMTipFont28
                                    textAlignment:(NSTextAlignmentCenter)];
    }
    return _qishiLab;
}

- (UILabel *)jiezhiLab {
    if (!_jiezhiLab) {
        _jiezhiLab = [UILabel commonLabelWithFrame:(CGRectMake(self.frame.size.width/2, self.endPicker.bottom, self.frame.size.width/2, kImgFit(50)))
                                             text:@"截止日期" color:kCSM444444TextColor font:kCSMTipFont28
                                    textAlignment:(NSTextAlignmentCenter)];
    }
    return _jiezhiLab;

}

- (UILabel *)toLab {
    if (!_toLab) {
        _toLab = [UILabel commonLabelWithFrame:(CGRectMake(0, self.endPicker.bottom, self.frame.size.width, kImgFit(50)))
                                          text:@"-" color:kCSM444444TextColor font:kCSMTipFont28
                                 textAlignment:(NSTextAlignmentCenter)];
    }
    return _toLab;
}

- (UILabel *)beginLab {
    if (!_beginLab) {
        _beginLab = [UILabel commonLabelWithFrame:(CGRectMake(-kImgFit(30), self.endPicker.bottom, self.frame.size.width/2, kImgFit(50)))
                                          text:@"" color:kCSM444444TextColor font:kCSMTipFont28
                                 textAlignment:(NSTextAlignmentRight)];
    }
    return _beginLab;
}

- (UILabel *)endLab {
    if (!_endLab) {
        _endLab = [UILabel commonLabelWithFrame:(CGRectMake(self.frame.size.width/2+kImgFit(30), self.endPicker.bottom, self.frame.size.width/2, kImgFit(50)))
                                          text:@"" color:kCSM444444TextColor font:kCSMTipFont28
                                 textAlignment:(NSTextAlignmentLeft)];
    }
    return _endLab;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {\
        _cancelBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _cancelBtn.frame = (CGRectMake(0, self.toLab.bottom, self.frame.size.width/2, kImgFit(100)));
        [_cancelBtn setTitle:@"取消" forState:(UIControlStateNormal)];
        [_cancelBtn setTitleColor:kCSM444444TextColor forState:(UIControlStateNormal)];
        _cancelBtn.titleLabel.font = kCSMTipFont28;
        _cancelBtn.backgroundColor = [UIColor whiteColor];
        [_cancelBtn addTarget:self action:@selector(hide) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _cancelBtn;
    
}

- (UIButton *)confirmBtn {
    if (!_confirmBtn) {
        _confirmBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        _confirmBtn.frame = (CGRectMake(0, self.toLab.bottom, self.frame.size.width, kImgFit(100)));
        [_confirmBtn setTitle:@"确定" forState:(UIControlStateNormal)];
        [_confirmBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        _confirmBtn.titleLabel.font = kCSMTipFont28;
        _confirmBtn.backgroundColor = [UIColor orangeColor];
    }
    return _confirmBtn;
}

#pragma mark - action

- (void)hide {
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.transform = CGAffineTransformTranslate(self.transform, 0, -CGRectGetMaxY(self.frame));
        self.mask.alpha = 0;
    } completion:^(BOOL isFinished) {
        [self.mask removeFromSuperview];
        [self removeFromSuperview];
    }];
}
- (void)addTap {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [self.mask addGestureRecognizer:tap];
}

- (void)show {
    self.transform = CGAffineTransformTranslate(self.transform, 0, -CGRectGetMaxY(self.frame));
    [UIView animateWithDuration:0.5 animations:^(void) {
        self.transform = CGAffineTransformIdentity;
    } completion:^(BOOL isFinished) {
    }];
}

@end
