//
//  EditprofileViewController.m
//  
//
//  Created by Saini  on 7/15/16.
//
//
#import <QuartzCore/QuartzCore.h>
#import "EditprofileViewController.h"
#import "CustomCollectionViewCell.h"
#import "AFNetworking.h"
@interface EditprofileViewController () <UICollectionViewDelegate,UICollectionViewDataSource>
{
    NSMutableArray *arr1;
    NSMutableArray *arr2;
    NSMutableArray *parsedata;
    NSString *savedUsername;
    NSString *savedPassword;
}
@end

@implementation EditprofileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self api];
    arr1 = [[NSMutableArray alloc] init];
    _editprof1_img.layer.cornerRadius=self.editprof1_img.frame.size.width /2;
    _editprof1_img.clipsToBounds = YES;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return [arr1 count];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CustomCollectionViewCell *cell = (CustomCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
       // cell.editprof_img.image =  arr1[indexPath.row];
  //  cell.editprof_img.image =[UIImage imageWithData:arr2];
    NSLog(@"HII%@",arr1);
    cell.editprof_img.layer.cornerRadius=cell.editprof_img.frame.size.width /2;
    cell.editprof_img.clipsToBounds = YES;
   cell.editprof_img.layer.borderColor = [UIColor greenColor].CGColor;
    cell.editprof_img.layer.masksToBounds = YES;
    return cell;
    
}

-(void)api
{
    AFHTTPSessionManager *manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    
    [manager.requestSerializer setAuthorizationHeaderFieldWithUsername:@"simran" password:@"motupatlu"];
    [manager GET:@"http://tifapi.e-sewak.com/users/" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        // NSLog(@"%@",responseObject);
        
        parsedata=[responseObject valueForKey:@"results"];
        NSLog(@"%@",parsedata);
        for (int i=0; i<parsedata.count; i++)
        {
            NSMutableDictionary *innerdata=[parsedata objectAtIndex:i];
            NSString *data=[innerdata valueForKey:@"ProfilePhoto"];
            [arr1 addObject:data];
            [self.Collectionview reloadData];
             NSLog(@"%@",arr1);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error: %@", error);
    }];

}

-(void)usedata
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    
    // getting an NSString
    savedUsername = [prefs stringForKey:@"UserName"];
    savedPassword = [prefs stringForKey:@"PassWord"];
    NSLog(@"%@%@",savedUsername,savedPassword);
}

@end
