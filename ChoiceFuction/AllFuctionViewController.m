
//
//  AllFuctionViewController.m
//  ChoiceFuction
//
//  Created by songge on 2017/4/7.
//  Copyright © 2017年 songge. All rights reserved.
//

#import "AllFuctionViewController.h"
#import "CustomSquare.h"
#import "SingleManger.h"
#import "ShopCollectionViewCell.h"
#import "SectionHeaderView.h"
#import "ViewController.h"

@interface AllFuctionViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionView;

@end

static NSString * const reuseIdentifier = @"Cell";
static NSString * const HeaderID = @"header";
static NSString * const FooterID = @"footer";

@implementation AllFuctionViewController{
    NSMutableArray *_dataArr;//格子数据
    NSMutableArray *_muArr;//添加;
    NSArray *_titleArr;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
        self.addGridTitleArray = [NSMutableArray arrayWithCapacity:17];
        self.addImageGridArray = [NSMutableArray arrayWithCapacity:17];
        self.addGridIdArray = [NSMutableArray arrayWithCapacity:17];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];
    [self configUI];
    _titleArr=@[@"账单",@"管理",@"营销",@"消息"];
    _muArr=[NSMutableArray array];
    
    UIView *topView=[[UIView alloc]initWithFrame:CGRectMake(0, 0,ScreenWidth , 55)];
    topView.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:topView];
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn1.frame=CGRectMake(10, 15, 60, 30);
    btn1.backgroundColor=[UIColor orangeColor];
    btn1.layer.masksToBounds=YES;
    btn1.layer.cornerRadius=8;
    [btn1 setTitle:@"返回" forState:UIControlStateNormal];
    [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn1];
    
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    
    btn2.frame=CGRectMake(ScreenWidth-70, 15, 60, 30);
    btn2.backgroundColor=[UIColor orangeColor];
    btn2.layer.masksToBounds=YES;
    btn2.layer.cornerRadius=8;
    [btn2 setTitle:@"确定" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(sure) forControlEvents:UIControlEventTouchUpInside];
    [topView addSubview:btn2];
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark -
#pragma mark 初始化UI
-(void)configUI{
    
    
    
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //单元格（每一项）的大小（宽高）
    layout.itemSize = CGSizeMake(ScreenWidth/4, ScreenWidth/4);
    //每小格（每个单元格之间的最小的间距）
    layout.minimumInteritemSpacing = 0;
    //最小行间距
    layout.minimumLineSpacing = 0;
    //每个分区之间的边距
    //    layout.sectionInset = UIEdgeInsetsMake(30, 10, 30, 10);
    layout.sectionInset =UIEdgeInsetsMake(0, 0, 0, 0);
    //设置滚动的方式
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight-64) collectionViewLayout:layout];
    self.collectionView.backgroundColor=[UIColor whiteColor];;
    self.collectionView.dataSource = self;
    self.collectionView.delegate = self;
    [self.view addSubview:self.collectionView];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"ShopCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier];
    [self.collectionView registerNib:[UINib nibWithNibName:@"SectionHeaderView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:HeaderID];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID];
    // 如果有class来注册这个头部或尾部视图时一定要用代码的方式去设置下这个头部或尾部的尺寸
    [self getData];

}
#pragma mark -
#pragma mark 加载数据
-(void)getData{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"AllFuction" ofType:@"plist"];
    _dataArr = [[NSMutableArray alloc] initWithContentsOfFile:plistPath];
    
//    NSMutableArray *titleArr = [SingleManger shareInstance].moreshowGridArray;
//    NSMutableArray *imageArr = [SingleManger shareInstance].moreshowImageGridArray;
//    NSMutableArray *idArr = [SingleManger shareInstance].moreshowGridIDArray;
//    NSLog(@"title :%@ , image :%@ , id :%@ ",titleArr,imageArr,idArr);
//    _showGridArray = [[NSMutableArray alloc]initWithArray:titleArr];
//    _showImageGridArray = [[NSMutableArray alloc]initWithArray:imageArr];
//    _showGridIDArray = [[NSMutableArray alloc]initWithArray:idArr];
    
    
    
    [self.collectionView reloadData];
}

#pragma mark -
#pragma mark 事件
-(void)saveArray
{
    // 保存更新后数组
    self.addGridTitleArray=[[NSMutableArray alloc]init];
    self.addImageGridArray=[[NSMutableArray alloc]init];
    self.addGridIdArray=[[NSMutableArray alloc]init];
    
    NSMutableArray * array1 = [[NSMutableArray alloc]init];
    NSMutableArray * array2 = [[NSMutableArray alloc]init];
    NSMutableArray * array3 = [[NSMutableArray alloc]init];
    for (int i = 0; i < _muArr.count; i++) {
        NSDictionary *dic=_muArr[i];
        NSString *seleStr=[dic objectForKey:@"isSel"];
        NSString *nameStr=[dic objectForKey:@"name"];
        NSString *imageStr=[dic objectForKey:@"image"];
        NSString *girdStr=[dic objectForKey:@"girdid"];
        
        if ([seleStr isEqualToString:@"0"]) {
            [array1 addObject:nameStr];
            [array2 addObject:imageStr];
            [array3 addObject:girdStr];
        }else{
            [self.addGridTitleArray addObject:nameStr];
            [self.addImageGridArray addObject:imageStr];
            [self.addGridIdArray addObject:girdStr];
        }
    }
    NSLog(@"+++=%@",self.addGridIdArray);
    
    // 保存更新后数组
    NSMutableArray * moreTitleArray = [SingleManger shareInstance].showGridArray;
    NSMutableArray * moreImageArray = [SingleManger shareInstance].showImageGridArray;
    NSMutableArray * moreIdArray = [SingleManger shareInstance].showGridIDArray;
    
    NSLog(@"hhhhhh = %@",moreIdArray);
    
    
    
    for (int n=0; n<array3.count; n++) {
        NSString *deleid=array3[n];
        for (int m =0; m<moreIdArray.count; m++) {
            NSString *moreid=moreIdArray[m];
            if ([deleid isEqualToString:moreid]) {
                [moreIdArray removeObjectAtIndex:m];
                [moreImageArray removeObjectAtIndex:m];
                [moreTitleArray removeObjectAtIndex:m];
            }
        }
    }
    
    for (int j=0; j<moreIdArray.count; j++) {
        NSString *moreid=moreIdArray[j];
        for (int i=0; i<self.addGridIdArray.count; i++) {
            NSString *addid=self.addGridIdArray[i];
            if ([addid isEqualToString:moreid]) {
                [self.addGridIdArray removeObjectAtIndex:i];
                [self.addImageGridArray removeObjectAtIndex:i];
                [self.addGridTitleArray removeObjectAtIndex:i];
            }
        }
    }
    NSLog(@"ssssss = %@",self.addGridIdArray);
    
    for (int i = 0; i < self.addGridTitleArray.count; i++) {
        [moreTitleArray insertObject:self.addGridTitleArray[i] atIndex:moreTitleArray.count-1];
        [moreImageArray insertObject:self.addImageGridArray[i] atIndex:moreImageArray.count-1];
        [moreIdArray insertObject:self.addGridIdArray[i] atIndex:moreIdArray.count-1];
    }
    
    NSLog(@"更新后idArray = %@",moreIdArray);
    
    [self.addGridTitleArray removeAllObjects];
    [self.addImageGridArray removeAllObjects];
    [self.addGridIdArray removeAllObjects];
    
    
    
    
    [SingleManger shareInstance].showGridArray = [[NSMutableArray alloc]initWithArray:moreTitleArray];
    [SingleManger shareInstance].showImageGridArray = [[NSMutableArray alloc]initWithArray:moreImageArray];
    [SingleManger shareInstance].showGridIDArray = [[NSMutableArray alloc]initWithArray:moreIdArray];
    
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"title"];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"image"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"gridID"];
    
    [[NSUserDefaults standardUserDefaults] setObject:moreTitleArray forKey:@"title"];
    [[NSUserDefaults standardUserDefaults] setObject:moreImageArray forKey:@"image"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[NSUserDefaults standardUserDefaults] setObject:moreIdArray forKey:@"gridID"];
    
    //    NSLog(@"更新后titleArray = %@",titleArray);
    //    NSLog(@"更新后imageArray = %@",imageArray);
    // NSLog(@"更新后idArray = %@",moreIdArray);
    
}



-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)sure{
     [self saveArray];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -
#pragma mark 数据请求

#pragma mark -
#pragma mark 代理
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return _dataArr.count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSArray *arr=_dataArr[section];
    return arr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ShopCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    cell.backgroundColor=[UIColor whiteColor];
    NSDictionary *mydic=_dataArr[indexPath.section][indexPath.row];
    
    NSMutableDictionary *dic=[mydic mutableCopy];
    cell.imageView.image=[UIImage imageNamed:[dic objectForKey:@"image"]];
    cell.nameLabel.text=[dic objectForKey:@"name"];
    
    [cell.addOrDeleImg setImage:[[UIImage imageNamed:@"30px_30px_+"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    cell.isSelcet = NO;
    [dic setObject:@"0" forKey:@"isSel"];
    
    
    NSInteger girdid=[[dic objectForKey:@"girdid"] integerValue];
    
    
    
    for (int i=0; i<self.HomeGridIdArray.count-1;i++ ) {
        NSInteger intId=[self.HomeGridIdArray[i] integerValue];
        if (girdid == intId) {
            [cell.addOrDeleImg setImage:[[UIImage imageNamed:@"30px_30px_-"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
            cell.isSelcet=YES;
            [dic setObject:@"1" forKey:@"isSel"];
            
        }
    }
    [_muArr addObject:dic];
    
    return cell;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    ShopCollectionViewCell *cell = (ShopCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    NSInteger dicInt;
    if (indexPath.section ==0 ) {
        dicInt=indexPath.row;
    }
    else if(indexPath.section ==1){
        dicInt = 3+indexPath.row;
    }
    else if(indexPath.section ==2){
        dicInt = 11+indexPath.row;
    }else{
        dicInt = 15 + indexPath.row;
    }
    if (cell.isSelcet == YES) {
        NSLog(@"111");
        [cell.addOrDeleImg setImage:[[UIImage imageNamed:@"30px_30px_+"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        NSDictionary *seDic = _muArr[dicInt];
        
        NSMutableDictionary *mSeDic=[seDic mutableCopy];
        [mSeDic setValue:@"0" forKey:@"isSel"];
        [_muArr removeObjectAtIndex:dicInt];
        [_muArr insertObject:mSeDic atIndex:dicInt];
    }else{
        NSLog(@"222");
        [cell.addOrDeleImg setImage:[[UIImage imageNamed:@"30px_30px_-"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        
        NSDictionary *seDic = _muArr[dicInt];
        
        NSMutableDictionary *mSeDic=[seDic mutableCopy];
        [mSeDic setValue:@"1" forKey:@"isSel"];
        [_muArr removeObjectAtIndex:dicInt];
        [_muArr insertObject:mSeDic atIndex:dicInt];
    }
    
    cell.isSelcet=!cell.isSelcet;
    
    NSLog(@"+++---===%@",_muArr);
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 35);
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(ScreenWidth, 5);
}

//头部，尾部视图
-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        //头部视图 从复用池取出对应的头部视图
        SectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:HeaderID forIndexPath:indexPath];
        headerView.myLabel.text = [NSString stringWithFormat:_titleArr[indexPath.section],indexPath.section];
        return headerView;
    }else { // 返回每一组的尾部视图
        UICollectionReusableView *footerView =  [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:FooterID forIndexPath:indexPath];
        footerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
        return footerView;
    }
}

#pragma mark -
#pragma mark 业务逻辑

#pragma mark -
#pragma mark 通知注册和销毁

@end
