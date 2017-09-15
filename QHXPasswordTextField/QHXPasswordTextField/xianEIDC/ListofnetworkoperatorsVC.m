//
//  ListofnetworkoperatorsVC.m
//  MobileGlobalCard
//
//  Created by 李忠华 on 2017/7/16.
//  Copyright © 2017年 Quanten. All rights reserved.
//

#import "ListofnetworkoperatorsVC.h"
#import "ListofnetworkoperatorsCell.h"

//#import "CustomerBuildingViewController.h"
#/**比例适配*/
#define MAINCOLOR [UIColor whileColor]
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568
@interface ListofnetworkoperatorsVC ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic)  UITableView *tableaView;

@end
@implementation ListofnetworkoperatorsVC

-(UITableView *)tableaView
{
    if (!_tableaView) {
        _tableaView= [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        [self.view addSubview:_tableaView];
        _tableaView.backgroundColor=  [UIColor whiteColor];
        
    }
    return _tableaView;
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
     self.tableaView.dataSource=self;
    self.tableaView.delegate = self;
    
    UIView *footView = [[UIView alloc]initWithFrame:CGRectMake(0, 0,SCREEN_W ,HEIGHT*100 )];
    footView.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    _tableaView.tableFooterView =footView;
}
//组的数量
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//每一组行的数量
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  
    return 10;
}

//创建每一行所展示的cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    ListofnetworkoperatorsCell *cell =[tableView dequeueReusableCellWithIdentifier:@"Listofnetworkoperators"];
    
    if (cell ==nil) {
        cell = [[ListofnetworkoperatorsCell alloc ]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Listofnetworkoperators"];
    }
    
    
  
    //3.3赋值
//    cell.cicyname.text=[NSString stringWithFormat:@"APN：vdcsvvcx"];
    cell.name.text = @"中国建设银行";
    cell.yunYingShangname.text =[NSString stringWithFormat:@"单笔限额20万,日限额100万，无月限额"];
    cell.icoimage.image = [UIImage imageNamed:@"siluoniwenya"];
//    cell.yunYingShangname.text =
    //4.返回cell46
  
    // 指定辅助view的类型
//    cell.accessoryType=UITableViewCellAccessoryDetailDisclosureButton;
    //返回
    return cell;
}


-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return HEIGHT*20;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HEIGHT*80;
}



-(void)dealloc
{
   

    self.tableaView.dataSource=nil;
    self.tableaView.delegate = nil;
    }


@end
