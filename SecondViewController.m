//
//  SecondViewController.m
//  TheIdeazFactory
//
//  Created by Saini  on 6/22/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UITextFieldDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    _name_signup.delegate=self;
    _username_signup.delegate=self;
    _password_signup.delegate=self;
    _cnfpass_signup.delegate=self;
    _email_signup.delegate=self;
    _mob_signup.delegate=self;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_name_signup resignFirstResponder];
    [_username_signup resignFirstResponder];
    [_password_signup resignFirstResponder];
    [_cnfpass_signup resignFirstResponder];
    [_email_signup resignFirstResponder];
    [_mob_signup resignFirstResponder];
    
    return YES;
}


- (IBAction)ver_btn1:(id)sender {
    [self validations];
    otpViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"otpViewController"];
    
    
    [self.navigationController pushViewController:obj animated:YES];
    

}
- (IBAction)mem_btn1:(id)sender {
    ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
    [self.navigationController pushViewController:obj animated:YES];
    

}
-(void)validations
{
    if ([_name_signup.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"Name field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if ([_username_signup.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"Username field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if ([_password_signup.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"Password field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if ([_cnfpass_signup.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"Confirm Password field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if ([_email_signup.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"EMAIL field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if ([_mob_signup.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"Mobile field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }

}
- (IBAction)name_signup:(id)sender {
}
- (IBAction)username_signup:(id)sender {
}
- (IBAction)password_signup:(id)sender {
}
- (IBAction)cnfpass_signup:(id)sender {
}
- (IBAction)email_signup:(id)sender {
}
- (IBAction)mob_signup:(id)sender {
}

@end
