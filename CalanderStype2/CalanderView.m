//
//  CalanderView.m
//  CalanderStype2
//
//  Created by apple on 17/11/6.
//  Copyright © 2017年 Jade. All rights reserved.
//

#import "CalanderView.h"
#import "SelectView.h"

@interface CalanderView ()

@property (nonatomic, copy) NSString *year;
@property (nonatomic, copy) NSString *month;
@property (nonatomic, copy) NSString *day;

@end

@implementation CalanderView

+ (instancetype)CalanderView {
    CalanderView *calanderView = [[NSBundle mainBundle]loadNibNamed:@"CalanderView" owner:nil options:nil].lastObject;
    return calanderView;
}

- (void)awakeFromNib
{
    [super awakeFromNib];

    // 设定选中的日子是2017年3月3日
    SelectView *yearSelectView = [SelectView SelectView];
    yearSelectView.frame = self.yearView.bounds;
    yearSelectView.style = YearOfView;
    yearSelectView.defaultStrng = @"2017";
    [self.yearView addSubview:yearSelectView];
    yearSelectView.selectAction = ^(NSString *dateString) {
        self.year = dateString;
    };
    
    SelectView *daySelectView = [SelectView SelectView];
    daySelectView.frame = self.dayView.bounds;
    daySelectView.style = DayOfView;
    daySelectView.dateString = @"2017年3月";

    daySelectView.defaultStrng = @"3日";
    [self.dayView addSubview:daySelectView];
    daySelectView.selectAction = ^(NSString *dateString) {
        self.day = dateString;
        NSLog(@"date = %@%@%@", self.year,self.month, self.day);
    };
    
    SelectView *monthSelectView = [SelectView SelectView];
    monthSelectView.frame = self.monthView.bounds;
    monthSelectView.style = MonthOfView;
    monthSelectView.defaultStrng = @"3";
    [self.monthView addSubview:monthSelectView];
    monthSelectView.selectAction = ^(NSString *dateString) {
        self.month = dateString;
        if (!self.year) {
            self.year = @"2017年";
        }
        daySelectView.dateString = [self.year stringByAppendingString:self.month];
    };
    
}

@end
