//
//  ViewController.m
//  Contentr
//
//  Created by Darren Peacock on 2015-12-11.
//  Copyright © 2015 YPG. All rights reserved.
//

#import "ViewController.h"

#import "MerchantSERPViewController.h"

#import "ProfilePageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"ContentR";
    
    self.navigationController.navigationBar.hidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)loginButtonSelected:(id)sender
{
    //MerchantSERPViewController *vc = [[MerchantSERPViewController alloc] initWithNibName:nil bundle:nil];
    
    ProfilePageViewController *vc = [[ProfilePageViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];

}
@end
