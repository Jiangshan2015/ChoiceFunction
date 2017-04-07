//
//  ShopCollectionViewCell.m
//  ManagerProject
//
//  Created by songge on 2017/4/1.
//  Copyright © 2017年 com. All rights reserved.
//

#import "ShopCollectionViewCell.h"

@implementation ShopCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.layer.borderColor=[UIColor groupTableViewBackgroundColor].CGColor;
    self.layer.borderWidth=0.8;
}

@end
