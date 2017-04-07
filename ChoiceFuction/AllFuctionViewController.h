//
//  AllFuctionViewController.h
//  ChoiceFuction
//
//  Created by songge on 2017/4/7.
//  Copyright © 2017年 songge. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AllFuctionViewController : UIViewController

//显示格子的GridId
@property(nonatomic, strong)NSMutableArray *showMoreGridIdArray;
@property(nonatomic, strong)NSMutableArray *showMoreGridTitleArray;
@property(nonatomic, strong)NSMutableArray *showMoreGridImageArray;

@property(nonatomic, strong)NSMutableArray *showGridArray; //title
@property(nonatomic, strong)NSMutableArray *showImageGridArray;//image
@property(nonatomic, strong)NSMutableArray *showGridIDArray;//gridId

//首页显示应用
@property(nonatomic, strong)NSMutableArray *addGridTitleArray;
@property(nonatomic, strong)NSMutableArray *addGridIdArray;
@property(nonatomic, strong)NSMutableArray *addImageGridArray;//image

//首页剩下的几个应用
@property(nonatomic, strong)NSMutableArray *HomeGridTitleArray;
@property(nonatomic, strong)NSMutableArray *HomeGridIdArray;
@property(nonatomic, strong)NSMutableArray *HomeImageGridArray;//image
@end
