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

// Helpers
#import <QuartzCore/QuartzCore.h>

@interface MerchantSERPViewController () <MDCSwipeToChooseDelegate>

@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UIView *secondCardView;
@property (weak, nonatomic) IBOutlet UIButton *finishedButton;

@property (strong, nonatomic) MerchantCardView *firstCard;
@property (strong, nonatomic) MerchantCardView *secondCard;

@property (strong, nonatomic) NSMutableArray *cardList;

@end

@implementation MerchantSERPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Merchants" ofType:@"plist"];
    NSArray *merchants = [[NSArray alloc] initWithContentsOfFile:path];
    self.cardList = [[NSMutableArray alloc] initWithArray:merchants];
    
    self.title = @"";
    
    self.finishedButton.layer.borderColor = [UIColor blackColor].CGColor;
    self.finishedButton.layer.borderWidth = 1.0;
    self.finishedButton.layer.cornerRadius = 20.0;
    
    [self addCardToTop];
    [self addSecondCard];
}

#pragma mark - Add new card
- (void)addCardToTop
{
    MerchantCardView *view = [self fetchCardUsingMerchant];
    self.firstCard = view;
    [self.cardView addSubview:view];
}

- (void)addSecondCard
{
    MerchantCardView *view = [self fetchCardUsingMerchant];
    self.secondCard = view;
    [self.secondCardView addSubview:view];
}

- (MerchantCardView *)fetchCardUsingMerchant
{
    NSDictionary *merchant = [self.cardList firstObject];
    [self.cardList removeObject:merchant];
    
    MDCSwipeToChooseViewOptions *options = [MDCSwipeToChooseViewOptions new];
    options.threshold = 50.f;
    options.delegate = self;
    options.likedText = @"";
    options.likedColor = [UIColor clearColor];
    options.nopeColor = [UIColor clearColor];
    options.nopeText = @"";
    options.onPan = ^(MDCPanState *state){
        if (state.thresholdRatio == 1.f && state.direction == MDCSwipeDirectionLeft)
        {
            NSLog(@"Let go now to delete the photo!");
            NSLog(@"First card:%@",self.firstCard.merchantNameLabel.text);
            NSLog(@"Second card:%@", self.secondCard.merchantNameLabel.text);
            
        }
        
        
        
    };
    
    MerchantCardView *view = [[MerchantCardView alloc] initWithFrame:self.cardView.bounds
                                                             options:options];
    
    [view.button addTarget:self action:@selector(didSelectCard) forControlEvents:UIControlEventTouchUpInside];
    
    view.merchantNameLabel.text = merchant[@"merchantName"];
    view.merchantAddressLabel.text = merchant[@"merchantAddress"];
    
    return view;
}

- (void)updateCards
{
    self.firstCard = self.secondCard;
    [self.cardView addSubview:self.firstCard];
    [self addSecondCard];
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
- (void)view:(UIView *)view wasChosenWithDirection:(MDCSwipeDirection)direction
{
    [self updateCards];
    
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
