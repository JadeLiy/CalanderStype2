//
//  CalanderView.h
//  CalanderStype2
//
//  Created by apple on 17/11/6.
//  Copyright © 2017年 Jade. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalanderView : UIView

@property (weak, nonatomic) IBOutlet UIView *yearView;
@property (weak, nonatomic) IBOutlet UIView *monthView;
@property (weak, nonatomic) IBOutlet UIView *dayView;

+ (instancetype)CalanderView;

@end
