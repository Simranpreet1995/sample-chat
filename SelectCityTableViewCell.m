//
//  SelectCityTableViewCell.m
//  TheIdeazFactory
//
//  Created by Saini  on 6/27/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import "SelectCityTableViewCell.h"
@interface SelectCityTableViewCell () <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSArray *strings;
}
@property  NSMutableArray* dataList;
@end
@implementation SelectCityTableViewCell
-(void)layoutSubviews
{
    [super layoutSubviews];
    
    strings = [[NSMutableArray alloc] init];
    [self readDataFromFile];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return strings.count;
}

-(CitypeopleCollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    CitypeopleCollectionViewCell *cell = (CitypeopleCollectionViewCell*)[collectionView dequeueReusableCellWithReuseIdentifier:@"collectioncell" forIndexPath:indexPath];
    
    cell.tags_lbl.text = [NSString stringWithFormat:@"%@",[strings objectAtIndex:indexPath.row]];
    [self.collection_city reloadData];
    
    return cell;
    
}

-(void)readDataFromFile
{
    NSString * filePath =[[NSBundle mainBundle] pathForResource:@"tagsapi" ofType:@"json"];
    
    NSError * error;
    NSString* fileContents =[NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    
    
    if(error)
    {
        NSLog(@"Error reading file: %@",error.localizedDescription);
    }
    
    
    self.dataList = (NSMutableArray *)[NSJSONSerialization
                                JSONObjectWithData:[fileContents dataUsingEncoding:NSUTF8StringEncoding]
                                options:0 error:NULL];
  //  NSLog(@"Tags %@", _dataList);
    id keyValuePair =self.dataList;
    NSString *tags = keyValuePair[@"tags"];
    strings = [tags componentsSeparatedByString:@","];
//    NSLog(@"Tags %lu", (unsigned long)strings.count);

   
}


@end
