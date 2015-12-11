//
//  MerchantSERPViewController.m
//  Contentr
//
//  Created by Darren Peacock on 2015-12-11.
//  Copyright © 2015 YPG. All rights reserved.
//

#import "MerchantSERPViewController.h"

#import <MDCSwipeToChoose/MDCSwipeToChoose.h>


@interface MerchantSERPViewController ()

@property (weak, nonatomic) IBOutlet UIView *cardView;

@end

@implementation MerchantSERPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.likedText = @"";
    options.likedColor = [UIColor clearColor];
    options.nopeColor = [UIColor clearColor];
    options.nopeText = @"";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft) {
            NSLog(@"Let go now to delete the photo!");
        }
    };
    
    MDCSwipeToChooseView *view = [[MDCSwipeToChooseView alloc] initWithFrame:self.cardView.bounds
                                                                     options:options];
    //view.imageView.image = [UIImage imageNamed:@"photo"];
    [self.cardView addSubview:view];
}




@end
