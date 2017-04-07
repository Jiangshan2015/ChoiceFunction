//
//  AppDelegate.m
//  ChoiceFuction
//
//  Created by songge on 2017/4/7.
//  Copyright © 2017年 songge. All rights reserved.
//

#import "AppDelegate.h"
#import "SingleManger.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    [self createData];
    return YES;
}


-(void)createData
{
    // 如果数组有改变
    NSArray * titleArray = [[NSArray alloc]init];
    NSArray * imageArray = [[NSArray alloc]init];
    NSArray * idArray = [[NSArray alloc]init];
    titleArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"title"];
    imageArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"image"];
    idArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"gridID"];
    NSLog(@"array = %@",titleArray);
    
    NSArray * moretitleArray = [[NSArray alloc]init];
    NSArray * moreimageArray = [[NSArray alloc]init];
    NSArray * moreidArray = [[NSArray alloc]init];
    moretitleArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"moretitle"];
    moreimageArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"moreimage"];
    moreidArray = [[NSUserDefaults standardUserDefaults] objectForKey:@"moregridID"];
    
    // Home按钮数组 体验账号
    [SingleManger shareInstance].showGridArray = [[NSMutableArray alloc]initWithCapacity:8];
    [SingleManger shareInstance].showImageGridArray = [[NSMutableArray alloc]initWithCapacity:8];
    
    [SingleManger shareInstance].showGridArray = [NSMutableArray arrayWithObjects:@"优惠券",@"红包",@"转盘", @"报名", @"结算",@"消费账单", @"销售报表",@"添加", nil];
    
    [SingleManger shareInstance].showImageGridArray =
    [NSMutableArray arrayWithObjects:
     @"58px_58px_youhuiquan",@"58px_58px_hongbao", @"58px_58px_zhuanpan",
     @"58px_58px_baoming",@"58px_58px_jiesuan" ,@"58px_58px_xiaofeizhangdan",
     @"58px_58px_xiaoshoubaobiao",@"添加功能", nil];
    
    [SingleManger shareInstance].showGridIDArray =
    [NSMutableArray arrayWithObjects:
     @"1011",@"1012", @"1013",
     @"1014",@"1002",@"1000" ,@"1001",
     @"0", nil];
    
    // 对比数组
    NSMutableString * defaString = [[NSMutableString alloc]init];
    NSMutableString * localString = [[NSMutableString alloc]init];
    
    // 默认
    for (int i = 0; i< [SingleManger shareInstance].showGridArray.count; i++) {
        [defaString appendString:[SingleManger shareInstance].showGridArray[i]];
        //        NSLog(@"defaString = %@",defaString);
    }
    // 本地
    for (int i = 0; i< titleArray.count; i++) {
        [localString appendString:titleArray[i]];
        //        NSLog(@"localString = %@",localString);
    }
    
    // 如果本地数组有改变
    if (![localString isEqualToString:defaString] && localString.length>2) {
        [SingleManger shareInstance].showGridArray = [[NSMutableArray alloc]initWithArray:titleArray];
        [SingleManger shareInstance].showImageGridArray = [[NSMutableArray alloc]initWithArray:imageArray];
        [SingleManger shareInstance].showGridIDArray = [[NSMutableArray alloc]initWithArray:idArray];
        
//        [SingleManger shareInstance].moreshowGridArray = [[NSMutableArray alloc]initWithArray:moretitleArray];
//        [SingleManger shareInstance].moreshowImageGridArray = [[NSMutableArray alloc]initWithArray:moreimageArray];
//        [SingleManger shareInstance].moreshowGridIDArray = [[NSMutableArray alloc]initWithArray:moreidArray];
    }
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
