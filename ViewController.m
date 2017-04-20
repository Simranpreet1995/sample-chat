//
//  ViewController.m
//  TheIdeazFactory
//
//  Created by Saini  on 6/21/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import "ViewController.h"
# import "SWRevealViewController.h"
#define baseURL @"http://192.168.1.82:8001/api/"

@interface ViewController ()<UITextFieldDelegate>
@property (weak,nonatomic) IBOutlet UIBarButtonItem *barbutton;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   // [self.navigationController setNavigationBarHidden:YES];
   _login_txt1.delegate = self;
    _login_txt2.delegate = self;
  _barbutton.target=self.revealViewController;
   _barbutton.action=@selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [[NSUserDefaults standardUserDefaults] setObject:_login_txt1.text forKey:@"username"];
    [[NSUserDefaults standardUserDefaults] setObject:_login_txt2.text forKey:@"password"];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated{
  
}
-(void)validations
{
    if ([_login_txt1.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"Username field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    if ([_login_txt2.text isEqualToString:@""])
    {
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"Password field cannot be empty" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:ok];
        UIAlertAction* cancel = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleDefault handler:nil];
        [alertController addAction:cancel];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [_login_txt1 resignFirstResponder];
    [_login_txt2 resignFirstResponder];
    
    return YES;
}

- (IBAction)btn_1:(id)sender {
    
    SecondViewController *obj = [self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
    
    
    [self.navigationController pushViewController:obj animated:YES];
    
}

- (IBAction)signin_btn:(id)sender {
    [self validations];
    //[self savedata];
    //[self postApi];
    NSString *usernmame =_login_txt1.text;
    NSString *password =_login_txt2.text;
    if ((usernmame=@"user") && (password=@"password")){
    CitypeopleViewController *obj1 = [self.storyboard instantiateViewControllerWithIdentifier:@"CitypeopleViewController"];
    [self.navigationController pushViewController:obj1 animated:YES];
    }
}

- (IBAction)login_txt1:(id)sender {
    
    
}

- (IBAction)login_txt2:(id)sender {
}

-(void)postApi
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:[NSString stringWithFormat:@"%@",_login_txt1.text ] password:[NSString stringWithFormat:@"%@",_login_txt2.text ]];
    [manager GET:@"http://tifapi.e-sewak.com/users/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@",responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
    
   /* AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://tifapi.e-sewak.com/users/" parameters:@{ @"username": [NSString stringWithFormat:@"%@",_login_txt1.text ],@"password":[NSString stringWithFormat:@"%@",_login_txt2.text ]} progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
    } failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
   */
    
    
}
-(void)savedata{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // saving an NSString
    [prefs setObject:_login_txt1.text forKey:@"UserName"];
    [prefs setObject:_login_txt2.text forKey:@"PassWord"];
    
    [prefs synchronize];

}
@end



