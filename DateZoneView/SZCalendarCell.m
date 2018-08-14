//
//  SZCalendarCell.m
//  SZCalendarPicker
//
//  Created by Stephen Zhuang on 14/12/1.
//  Copyright (c) 2014年 Stephen Zhuang. All rights reserved.
//

#import "SZCalendarCell.h"

@implementation SZCalendarCell
- (UILabel *)dateLabel
{
    if (!_dateLabel) {
        _dateLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [_dateLabel setTextAlignment:NSTextAlignmentCenter];
        [_dateLabel setFont:[UIFont systemFontOfSize:17]];
        [self addSubview:_dateLabel];
    }
    return _dateLabel;
}

- (void)setSelected:(BOOL)selected {
    [super setSelected:selected];
    if (selected) {
        self.backgroundColor = [UIColor yellowColor];
    }else {
        self.backgroundColor = [UIColor whiteColor];
    }
//    self.backgroundColor = [UIColor groupTableViewBackgroundColor];
}
@end
