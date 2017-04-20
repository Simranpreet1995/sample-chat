//
//  SelectCityTableViewCell.h
//  TheIdeazFactory
//
//  Created by Saini  on 6/27/16.
//  Copyright © 2016 Saini . All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CitypeopleCollectionViewCell.h"

@interface SelectCityTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *dp_img;
@property (weak, nonatomic) IBOutlet UILabel *name_lbl;
@property (weak, nonatomic) IBOutlet UILabel *tagname_lbl;
@property (weak, nonatomic) IBOutlet UICollectionView *collection_city;
@property (weak, nonatomic) IBOutlet UILabel *id_lbl;

@end
