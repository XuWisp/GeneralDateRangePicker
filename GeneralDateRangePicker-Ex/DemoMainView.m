//
//  DemoMainView.m
//  GeneralSegment
//
//  Created by xush on 2018/7/24.
//  Copyright © 2018年 Xush. All rights reserved.
//

#import "DemoMainView.h"
#import "UIView+WispFrame.h"


@interface DemoMainView () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray *cellDataMArr;
@property (nonatomic, strong) NSMutableArray *cellDetailMArr1;
@property (nonatomic, strong) NSMutableArray *cellDetailMArr2;

@end

@implementation DemoMainView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    [self addSubview:self.tipLab];
    [self addSubview:self.setTV];
}

#pragma mark - lazyload

- (UITableView *)setTV {
    if (!_setTV) {
        float top = (self.tipLab.frame.origin.y+self.tipLab.frame.size.height);
        _setTV = [[UITableView alloc] initWithFrame:(CGRectMake(0,
                                                                top,
                                                                [UIScreen mainScreen].bounds.size.width,
                                                                self.frame.size.height-top))
                                              style:(UITableViewStylePlain)];
        _setTV.dataSource = self;
        _setTV.delegate = self;
    }
    return _setTV;
}

- (NSMutableArray *)cellDataMArr {
    if (!_cellDataMArr) {
        NSMutableArray *mArr1 = [@[@"DataCount"] mutableCopy];
        NSMutableArray *mArr2 = [@[@"BtnTColor", @"BtnTColorS", @"BtnFont", @"BtnFontS", @"BtnWidth"] mutableCopy];
        NSMutableArray *mArr3 = [@[@"lineViewWidth", @"lineViewHeight", @"lineViewColor"] mutableCopy];
        NSMutableArray *mArr4 = [@[@"sepLineViewWidth", @"sepLineViewHeight", @"sepLineViewColor"] mutableCopy];
        NSMutableArray *mArr5 = [@[@"scrollView"] mutableCopy];
        _cellDataMArr = [@[mArr1, mArr2, mArr3, mArr4, mArr5] mutableCopy];
    }
    return _cellDataMArr;
}

- (NSMutableArray *)cellDetailMArr1 {
    if (!_cellDetailMArr1) {
        NSMutableArray *mArr1 = [@[@"->4"] mutableCopy];
        NSMutableArray *mArr2 = [@[@"BlackColor", @"BlackColor", @"SysFont18", @"SysFont20", @"0.0f"] mutableCopy];
        NSMutableArray *mArr3 = [@[@"BtnTextLength", @"4.0f", @"BlackColor"] mutableCopy];
        NSMutableArray *mArr4 = [@[@"1.0f", @"30.0f", @"GrayColor"] mutableCopy];
        NSMutableArray *mArr5 = [@[@"scrollView"] mutableCopy];
        _cellDetailMArr1 = [@[mArr1, mArr2, mArr3, mArr4, mArr5] mutableCopy];
    }
    return _cellDetailMArr1;
}

- (NSMutableArray *)cellDetailMArr2 {
    if (!_cellDetailMArr2) {
        NSMutableArray *mArr1 = [@[@"->9"] mutableCopy];
        NSMutableArray *mArr2 = [@[@"OrangeColor", @"RedColor", @"SysFont18Blod", @"SysFont20Blod", @"BtnTextLength+20.0f"] mutableCopy];
        NSMutableArray *mArr3 = [@[@"50", @"10.0f", @"CyanColor"] mutableCopy];
        NSMutableArray *mArr4 = [@[@"5.0f", @"50.0f", @"ClearColor"] mutableCopy];
        NSMutableArray *mArr5 = [@[@"scrollView"] mutableCopy];
        _cellDetailMArr2 = [@[mArr1, mArr2, mArr3, mArr4, mArr5] mutableCopy];
    }
    return _cellDetailMArr2;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.cellDataMArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return ((NSMutableArray *)self.cellDataMArr[section]).count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *HomeMapIdentifier = @"mainCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:HomeMapIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:HomeMapIdentifier];
    }
    cell.textLabel.text = ((NSMutableArray *)self.cellDataMArr[indexPath.section])[indexPath.row];
    cell.detailTextLabel.text = self.cellDetailMArr1[indexPath.section][indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 10.0f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:(CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 5))];
    view.backgroundColor = UIColorFromHex(0xf1f1f1);
    return view;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    BOOL isNormal = [cell.detailTextLabel.text isEqualToString:self.cellDetailMArr1[indexPath.section][indexPath.row]];
    if (isNormal) {
        cell.detailTextLabel.text = self.cellDetailMArr2[indexPath.section][indexPath.row];
    }else {
        cell.detailTextLabel.text = self.cellDetailMArr1[indexPath.section][indexPath.row];
    }
    switch (indexPath.section) {
        case 0: { //
            switch (indexPath.row) {
                case 0:
                    if (isNormal) {

                    }else {

                    }
                    break;
                    
                default:
                    break;
            }
            break;}
        default:
            break;
    }
}

#pragma mark - action


#pragma mark - other



#pragma mark - data set


@end
