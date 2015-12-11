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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startButtonSelected:(id)sender
{
    MerchantSERPViewController *vc = [[MerchantSERPViewController alloc] initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:vc animated:YES];

}


@end
