//
//  SecondViewController.h
//  TheIdeazFactory
//
//  Created by Saini  on 6/22/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"
#import "otpViewController.h"
@interface SecondViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name_signup;
@property (weak, nonatomic) IBOutlet UITextField *username_signup;
@property (weak, nonatomic) IBOutlet UITextField *password_signup;
@property (weak, nonatomic) IBOutlet UITextField *cnfpass_signup;
@property (weak, nonatomic) IBOutlet UITextField *email_signup;
@property (weak, nonatomic) IBOutlet UITextField *mob_signup;

@end
