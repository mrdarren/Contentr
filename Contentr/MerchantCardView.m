//
//  MerchantCardView.m
//  Contentr
//
//  Created by Darren Peacock on 2015-12-11.
//  Copyright © 2015 YPG. All rights reserved.
//

#import "MerchantCardView.h"

@interface MerchantCardView ()

@property (nonatomic, strong) UIView *contentView;

@end

@implementation MerchantCardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame options:(MDCSwipeToChooseViewOptions *)options
{
    self = [super initWithFrame:frame options:options];
    if (self)
    {
        [self addContentView];
    }
    
    return self;
}


- (void)addContentView
{
    self.contentView = [[[NSBundle bundleForClass:[self class]] loadNibNamed:@"MerchantCardView" owner:self options:nil] firstObject];
    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    [self addSubview:self.contentView];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[contentView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{
                                                                           @"contentView" : self.contentView
                                                                           }]];
    [self addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[contentView]|"
                                                                 options:0
                                                                 metrics:nil
                                                                   views:@{
                                                                           @"contentView" : self.contentView
                                                                           }]];
}

@end
