//
//  ShopCollectionViewCell.h
//  ManagerProject
//
//  Created by songge on 2017/4/1.
//  Copyright © 2017年 com. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShopCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *addOrDeleImg;

@property (nonatomic,assign)BOOL isSelcet;


@end
