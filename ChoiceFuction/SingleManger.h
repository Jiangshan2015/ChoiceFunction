//
//  SingleManger.h
//  ChoiceFuction
//
//  Created by songge on 2017/4/7.
//  Copyright © 2017年 songge. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SingleManger : NSObject

// 主页 按钮 数组
@property (strong,nonatomic) NSMutableArray * showGridArray; // 标题
@property (strong,nonatomic) NSMutableArray * showImageGridArray; // 图片
@property (strong,nonatomic) NSMutableArray * showGridIDArray;  //button的ID

+(SingleManger *)shareInstance;
@end
