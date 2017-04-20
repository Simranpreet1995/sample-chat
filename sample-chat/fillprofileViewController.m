//
//  fillprofileViewController.m
//  StartupJalsa
//
//  Created by Saini  on 7/26/16.
//  Copyright © 2016 Quickblox. All rights reserved.
//

#import "fillprofileViewController.h"

@interface fillprofileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *fill_img;

@end

@implementation fillprofileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = NSLocalizedString(@"Jalsa App", nil);
    
   // SWRevealViewController *revealController = [self revealViewController];
    
   // [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    
   // UIBarButtonItem *revealButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"menu-4-xxl"]
     ///                                                                    style:UIBarButtonItemStyleBordered target:revealController action:@selector(revealToggle:)];
    
 //   self.navigationItem.leftBarButtonItem = revealButtonItem;
    
    self.fill_img.layer.cornerRadius = self.fill_img.frame.size.width / 2;
    self.fill_img.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
