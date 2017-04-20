//
//  otpViewController.m
//  TheIdeazFactory
//
//  Created by Saini  on 6/23/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import "otpViewController.h"

@interface otpViewController () <UITextFieldDelegate>

@end

@implementation otpViewController
- (IBAction)otp_txt1:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _otp_txt1.delegate = self;
//[self.navigationController setNavigationBarHidden:YES];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_otp_txt1 resignFirstResponder];
    
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)otp_lbl:(id)sender {
    [self validations];
   // ViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
    
    
    //[self.navigationController pushViewController:obj animated:YES];
    

}
-(void)validations
{
    if ([_otp_txt1.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"OTP field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}
@end
