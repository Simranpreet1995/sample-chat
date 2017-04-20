//
//  SelectCityViewController.m
//  TheIdeazFactory
//
//  Created by Saini  on 6/28/16.
//  Copyright © 2016 Saini . All rights reserved.
//
#import "SelectCityViewController.h"
#import "AFNetworking.h"
#import "SelectcityCell.h"
#import "LoginTableViewController.h"
#import "SWRevealViewController.h"
@interface SelectCityViewController () <UITableViewDelegate,UITableViewDataSource>
{
    NSMutableArray *arrn;
    int j;
    NSMutableArray *arri;
}
@property (nonatomic, strong) NSArray *valuesArray;
@property (weak, nonatomic) IBOutlet UITableView *tableview;
@property (nonatomic, strong) NSArray *finalArray;
@property (weak,nonatomic) IBOutlet UIBarButtonItem *barbutton;
@property  NSMutableDictionary* dataList1;

@end

@implementation SelectCityViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
  //  [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
    
    arrn = [[NSMutableArray alloc] init];
    arri = [[NSMutableArray alloc] init];

    _barbutton.target=self.revealViewController;
    _barbutton.action=@selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    [self readDataFromFile];
    // [self api] ;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn_1:(id)sender {
   // [self api] ;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;    //count of section
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return arrn.count;
}

- (SelectcityCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *MyIdentifier = @"Cell";
    
    SelectcityCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    
    if (cell == nil)
    {
        cell = [[SelectcityCell alloc] initWithStyle:UITableViewCellStyleDefault
                                          reuseIdentifier:MyIdentifier];
    }
    cell.selectcity_cellbl.text=[NSString stringWithFormat:@"%@",[arrn objectAtIndex:indexPath.row]];
    cell.startupphone.text=[NSString stringWithFormat:@"%@",[arri objectAtIndex:indexPath.row]];
    

    return cell;
}

/*-(void)api
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://api.geonames.org/citiesJSON?north=44.1&south=-9.9&east=-22.4&west=55.2&lang=de&username=demo" parameters:nil progress:nil success:^(NSURLSessionTask *task, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
     
                 NSLog(@"JSON: %@", responseObject);
                 NSMutableArray *geonames=[responseObject valueForKey:@"geonames"];
                 for (int i=0; i<geonames.count; i++)
                 {
                     NSMutableDictionary *inner=[geonames objectAtIndex:i];
                     NSString *data=[inner valueForKey:@"name"];
                     [arr1 addObject:data];
                     [self.tableView reloadData];
                     NSLog(@"%@",arr1);
                 }
    }
        failure:^(NSURLSessionTask *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
        
    
}*/

- (IBAction)seg1:(UISegmentedControl *)sender {
    [self segment];
}

-(void)segment
{
    //       if (_seg2.selectedSegmentIndex==1)
    // {
    //   SelectCityViewController *View2=[[SelectCityViewController alloc]init];
    // View2 = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectCityViewController"];
    
    //}
    if (_seg1.selectedSegmentIndex==0)
    {
       LoginTableViewController *obj1 = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginTableViewController"];
        [self.navigationController pushViewController:obj1 animated:NO];
    }
    if (_seg1.selectedSegmentIndex==1)
    {
       // SelectCityViewController *obj1 = [self.storyboard instantiateViewControllerWithIdentifier:@"SelectCityViewController"];
       // [self.navigationController pushViewController:obj1 animated:YES];
    }
    if (_seg1.selectedSegmentIndex==2)
    {
        CitypeopleViewController *obj1 = [self.storyboard instantiateViewControllerWithIdentifier:@"CitypeopleViewController"];
        [self.navigationController pushViewController:obj1 animated:NO];
    }
    
}

-(void)readDataFromFile
{
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"info2" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    
    self.dataList1 = (NSMutableDictionary *)[NSJSONSerialization
                                            JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                            options:0 error:NULL];
    NSLog(@"Select %@", _dataList1);
    id keyValuePair =self.dataList1;
    NSMutableArray *info = keyValuePair;
    for (j=0; j<info.count; j++)
    {
        NSMutableDictionary *innerdata1=[info objectAtIndex:j];
        NSString *data1=[innerdata1 valueForKey:@"Name"];
        NSLog(@"nifo %@", data1);
        NSString *data2=[innerdata1 valueForKey:@"Phone"];
        [arrn addObject:data1];
        NSLog(@"ifo %@",arrn);
        [arri addObject:data2];
    }
}

@end
