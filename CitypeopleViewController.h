//
//  CitypeopleViewController.h
//  TheIdeazFactory
//
//  Created by Saini  on 6/27/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CitypeopleViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lbl_cityname;
@property (strong,nonatomic) NSString *str;
@property (strong,nonatomic) NSString *str1;
@property (weak, nonatomic) IBOutlet UIButton *citymenu_btn;
@property (weak,nonatomic) IBOutlet UIButton *menu_btn;
@end
