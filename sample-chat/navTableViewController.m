//
//  navTableViewController.m
//  StartupJalsa
//
//  Created by Saini  on 11/25/16.
//  Copyright © 2016 Quickblox. All rights reserved.
//

#import "navTableViewController.h"
#import "SWRevealViewController.h"
@interface navTableViewController ()

@end

@implementation navTableViewController {
    NSArray *menu;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    menu=@[@"first",@"second",@"third",@"logout"];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [menu count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    NSString *cellIdentifier=[menu objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    
    return cell;
}


/*- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ( [segue isKindOfClass:[SWRevealViewControllerSegueSetController class]]){
        SWRevealViewControllerSegueSetController *swsegue = (SWRevealViewControllerSegueSetController*) segue;
        swsegue.performBlock = ^(SWRevealViewControllerSegueSetController *rvc_segue, UIViewController *svc, UIViewController *dvc) {
            UINavigationController *navController = (UINavigationController*)self.revealViewController.frontViewController;
            [navController setViewControllers:@[dvc] animated:NO];
            [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
        };
    }
*/
    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
        
        if([segue isKindOfClass:[SWRevealViewControllerSegueSetController class] ]){
            
            UIViewController *dvc = [segue destinationViewController];
            
            UINavigationController *navCtrl = (UINavigationController *) self.revealViewController.frontViewController;
            
            [navCtrl setViewControllers:@[dvc] animated:NO];
            
            [self.revealViewController setFrontViewPosition:FrontViewPositionLeft animated:YES];
        }
}





@end
