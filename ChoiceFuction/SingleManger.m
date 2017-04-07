//
//  SingleManger.m
//  ChoiceFuction
//
//  Created by songge on 2017/4/7.
//  Copyright © 2017年 songge. All rights reserved.
//

#import "SingleManger.h"

@implementation SingleManger
+(SingleManger *)shareInstance
{
    static SingleManger * singletonManager = nil;
    @synchronized(self){
        if (!singletonManager) {
            singletonManager = [[SingleManger alloc]init];
        }
    }
    return singletonManager;
}
@end
