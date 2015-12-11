//
//  MerchantSERPViewController.m
//  Contentr
//
//  Created by Darren Peacock on 2015-12-11.
//  Copyright © 2015 YPG. All rights reserved.
//

#import "MerchantSERPViewController.h"

#import <MDCSwipeToChoose/MDCSwipeToChoose.h>

#import "MerchantCardView.h"

#import "MerchantInfoViewController.h"


@interface MerchantSERPViewController () <MDCSwipeToChooseDelegate>

@property (weak, nonatomic) IBOutlet UIView *cardView;

@end

@implementation MerchantSERPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addAnewCard];
    
//    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
//    options.delegate = self;
//    options.likedText = @"";
//    options.likedColor = [UIColor clearColor];
//    options.nopeColor = [UIColor clearColor];
//    options.nopeText = @"";
//    options.onPan = ^(MDCPanState *state){
//        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft)
//        {
//            NSLog(@"Let go now to delete the photo!");
//            // Add another card
//        }
//    };
//    
//    MerchantCardView *view = [[MerchantCardView alloc] initWithFrame:self.cardView.bounds
//                                                                     options:options];
//   // view.backgroundColor = [UIColor blueColor];
//    
//    
//    //view.imageView.image = [UIImage imageNamed:@"photo"];
//    [self.cardView addSubview:view];
}


#pragma mark - Add new card
- (void)addAnewCard
{
    
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.delegate = self;
    options.likedText = @"";
    options.likedColor = [UIColor clearColor];
    options.nopeColor = [UIColor clearColor];
    options.nopeText = @"";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft)
        {
            NSLog(@"Let go now to delete the photo!");
        }
        
        
        
    };
    
    MerchantCardView *view = [[MerchantCardView alloc] initWithFrame:self.cardView.bounds
                                                             options:options];
    
    [view.button addTarget:self action:@selector(didSelectCard) forControlEvents:UIControlEventTouchUpInside];
    
    //view.imageView.image = [UIImage imageNamed:@"photo"];
    [self.cardView addSubview:view];
}


#pragma mark - MDCSwipeToChooseDelegate Callbacks
// This is called when a user didn't fully swipe left or right.
- (void)viewDidCancelSwipe:(UIView *)view
{
    NSLog(@"Couldn't decide, huh?");
}

// Sent before a choice is made. Cancel the choice by returning `NO`. Otherwise return `YES`.
- (BOOL)view:(UIView *)view shouldBeChosenWithDirection:(MDCSwipeDirection)direction {
    if (direction == MDCSwipeDirectionLeft) {
        return YES;
    } else {
        // Snap the view back and cancel the choice.
        [UIView animateWithDuration:0.16 animations:^{
            view.transform = CGAffineTransformIdentity;
            view.center = [view superview].center;
        }];
        return NO;
    }
}

// This is called then a user swipes the view fully left or right.
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction {
    
    [self addAnewCard];
    
    if (direction == MDCSwipeDirectionLeft) {
        NSLog(@"Photo deleted!");
    } else {
        NSLog(@"Photo saved!");
    }
}

#pragma mark - Actions
- (void)didSelectCard
{
    MerchantInfoViewController *vc = [[MerchantInfoViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


@end
