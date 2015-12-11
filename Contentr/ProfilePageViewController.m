//
//  ProfilePageViewController.m
//  Contentr
//
//  Created by Darren Peacock on 2015-12-11.
//  Copyright © 2015 YPG. All rights reserved.
//

#import "ProfilePageViewController.h"

#import "MerchantSERPViewController.h"

@interface ProfilePageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation ProfilePageViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    self.navigationController.navigationBar.backgroundColor = [UIColor clearColor];
}

#pragma mark - Actions
- (IBAction)startButtonSelected:(id)sender
{
    MerchantSERPViewController *vc = [[MerchantSERPViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];

}


@end
