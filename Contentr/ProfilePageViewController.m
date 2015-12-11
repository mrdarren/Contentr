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
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

#pragma mark - Actions
- (IBAction)startButtonSelected:(id)sender
{
    MerchantSERPViewController *vc = [[MerchantSERPViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];

}


@end
