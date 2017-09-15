//
//  HZRegionalChoiceVC.m
//  QHXPasswordTextField
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "HZRegionalChoiceVC.h"
#import "SecondViewController.h"
#import "ThridViewController.h"
@interface HZRegionalChoiceVC ()<UITableViewDelegate,UITableViewDataSource>

/** 省市列表 */
@property (nonatomic, strong) UITableView *tableView;
/** 全部数组 */
@property (nonatomic, strong) NSArray *stateArray;

@property(nonatomic,strong)UIView *toubjView;
@property(nonatomic,strong)UIImageView *tdingweiView;



@end

@implementation HZRegionalChoiceVC

-(NSArray *)stateArray
{
    if (_stateArray==nil) {
        
        NSString * path = [[NSBundle mainBundle]pathForResource:@"area.plist" ofType:nil];
        _stateArray = [NSArray arrayWithContentsOfFile:path];
    }
    return _stateArray;
}


-(UIView *)toubjView
{
    if (!_toubjView) {
        _toubjView = [[UIView alloc]initWithFrame:CGRectMake(0, 60, self.view.frame.size.width, 50)];
        _toubjView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    }
    return _toubjView;
}
-(UIImageView *)tdingweiView
{
    if (!_tdingweiView) {
        _tdingweiView = [[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
        _tdingweiView.image = [UIImage imageNamed:@"定位1x"];
    }
    return _tdingweiView                                                                                  ;
}

-(UILabel *)dingweiName
{
    if(!_dingweiName)
    {
        _dingweiName = [[UILabel alloc]initWithFrame:CGRectMake(55, 10, self.view.frame.size.width -80, 30)];
        [_dingweiName setTextColor:[UIColor blueColor]];
        _dingweiName.font = [UIFont systemFontOfSize:16];
//        _dingweiName.text = @"北京市";
    }
    return _dingweiName;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.toubjView ];
       [self.toubjView addSubview:self.tdingweiView ];
    [self.toubjView addSubview:self.dingweiName ];
    
    
    
    self.title = @"选择地址";
    UITableView * tableView = [[UITableView alloc]initWithFrame:CGRectMake(0,  110, self.view.frame.size.width, self.view.frame.size.height -110) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    self.tableView = tableView;
    
    NSMutableArray * test_array = [NSMutableArray array];
    for (NSDictionary * dic in self.stateArray) {
        // 数组中包含的是是省数组
        [test_array addObject:dic[@"state"]];
    }
    self.data_array = test_array;
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.data_array.count;
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID= @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID ];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

    cell.textLabel.text = self.data_array[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SecondViewController * second = [[SecondViewController alloc]init];
    [self.navigationController pushViewController:second animated:YES];
    
    NSDictionary * dic = self.stateArray[indexPath.row];
    // 省份名称等于数组里每个cell对应的省名称
    second.province = self.data_array[indexPath.row];
    // 把整个数组中的cities赋值给area_array
    second.area_array = dic[@"cities"];
}


@end
