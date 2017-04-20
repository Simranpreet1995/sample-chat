//
//  CitypeopleViewController.m
//  TheIdeazFactory
//
//  Created by Saini  on 6/27/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import "CitypeopleViewController.h"
#import "SelectCityTableViewCell.h"
#import "SelectCityViewController.h"
#import "AFNetworking.h"
#import "LoginTableViewController.h"
#import "CitypeopleCollectionViewCell.h"
#import "SWRevealViewController.h"

NSMutableArray *arr1;
NSMutableArray *arr2;
NSMutableArray *innerstrings;
@interface CitypeopleViewController () <UITableViewDelegate,UITableViewDataSource>
{   int i;
    int j;
    int k;
    NSString *savedUsername;
    NSString *savedPassword;
    NSString *dataimage;
    NSMutableArray *strings;
    NSIndexPath *tablepath ;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *seg2;
@property  NSMutableDictionary* dataList;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *barbutton;

@end

@implementation CitypeopleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.navigationController setNavigationBarHidden:YES];
  //  self.tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    _barbutton.target=self.revealViewController;
    _barbutton.action=@selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    arr1 = [[NSMutableArray alloc] init];
    arr2 = [[NSMutableArray alloc] init];
    
    [self usedata];
    //[self api];
    strings = [[NSMutableArray alloc] init];
    [self readDataFromFile];
    
  }

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return arr1.count;    //count number of row from counting array hear cataGorry is An Array
}



- (SelectCityTableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)tablePath
{
    static NSString *MyIdentifier = @"citycell";
    
    SelectCityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[SelectCityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                              reuseIdentifier:MyIdentifier];
    }
    cell.name_lbl.text=[NSString stringWithFormat:@"%@",[arr1 objectAtIndex:tablePath.row]];
    cell.id_lbl.text=[NSString stringWithFormat:@"%@",[arr2 objectAtIndex:tablePath.row]];
   // [ setImage:[NSURL URLWithString:@"http://myimageurl.com/imagename.jpg"]];
  //  NSData* imageData = [[NSData alloc] initWithContentsOfURL:[NSURL URLWithString: [arr2 objectAtIndex:tablePath.row]]];
//    cell.dp_img = [UIImage imageWithData:imageData];

    cell.dp_img.layer.cornerRadius=cell.dp_img.frame.size.width /2;
    cell.dp_img.clipsToBounds = YES;
    return cell;
}

/*-(void)api
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:savedUsername password:savedPassword];
    [manager GET:@"http://tifapi.e-sewak.com/users/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
       // NSLog(@"%@",responseObject);
        
        NSMutableArray *parsedata=[responseObject valueForKey:@"results"];
        NSLog(@"%@",parsedata);
       for (i=0; i<parsedata.count; i++)
        {
            NSMutableDictionary *innerdata=[parsedata objectAtIndex:i];
            NSString *data=[innerdata valueForKey:@"Name"];
        //    dataimage=[innerdata valueForKey:@""];
          //  [arr2 addObject:dataimage];
            [arr1 addObject:data];
            [self.tableView reloadData];
            NSLog(@"arr1%@",arr1);
            
            
          //  NSString *data1=[innerdata valueForKey:@"StartupTags"];
           // strings = [data1 componentsSeparatedByString:@","];
            
            NSLog(@"fo%lu",(unsigned long)strings.count);
            
         //   [arr2 addObject:strings];
           // NSLog(@"fo%lu",(unsigned long)arr2.count);
            
        }

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];
    */
    
- (IBAction)seg2:(UISegmentedControl *)sender {
    [self segment];
}

-(void)segment
{
    if (_seg2.selectedSegmentIndex==0)
    {
   LoginTableViewController *obj1 = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginTableViewController"];
    [self.navigationController pushViewController:obj1 animated:NO];
    }
    if (_seg2.selectedSegmentIndex==1)
    {
        SelectCityViewController *obj1 = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectCityViewController"];
        [self.navigationController pushViewController:obj1 animated:NO];
    }
    if (_seg2.selectedSegmentIndex==2)
    {
        //CitypeopleViewController *obj1 = [self.storyboard instantiateViewControllerWithIdentifier:@"CitypeopleViewController"];
      //  [self.navigationController pushViewController:obj1 animated:YES];
    }

    
}

-(void)usedata
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    savedUsername = [prefs stringForKey:@"UserName"];
    savedPassword = [prefs stringForKey:@"PassWord"];
    NSLog(@"%@%@",savedUsername,savedPassword);
}

-(void)readDataFromFile
{
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"info" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    
    self.dataList = (NSMutableDictionary *)[NSJSONSerialization
                                       JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                       options:0 error:NULL];
    NSLog(@"info %@", _dataList);
    id keyValuePair =self.dataList;
    NSMutableArray *info = keyValuePair;
    for (j=0; j<info.count; j++)
    {
        NSMutableDictionary *innerdata1=[info objectAtIndex:j];
        NSString *data1=[innerdata1 valueForKey:@"Name"];
        NSLog(@"nifo %@", data1);
        NSString *data2=[innerdata1 valueForKey:@"ID"];
        [arr1 addObject:data1];
        NSLog(@"ifo %@",arr1);
        [arr2 addObject:data2];
    }
        
}

@end
