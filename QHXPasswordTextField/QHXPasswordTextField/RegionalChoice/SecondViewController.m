//
//  SecondViewController.m
//  city
//
//  Created by Cnw on 16/2/29.
//  Copyright © 2016年 Cnw. All rights reserved.
//

#import "SecondViewController.h"
#import "ThridViewController.h"
#import "HZRegionalChoiceVC.h"
@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"地区选择";
    NSMutableArray * test_array = [NSMutableArray array];
    for (NSDictionary *dic in self.area_array) {
        [test_array addObject:dic[@"city"]];
    }
    self.data_array = test_array;
    
    
    self.dingweiName.text = self.province;
    NSLog(@"%@", self.dingweiName.text);

}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary * dic = self.area_array[indexPath.row];
    ThridViewController * thrid = [[ThridViewController alloc]init];
    // 省份
    thrid.province = self.province;
    // 市区
    thrid.select_area = self.data_array[indexPath.row];
    // 县城
    thrid.county_Array = dic[@"areas"];

    // 判断如果没有县级点击就返回上级界面
    
    if (thrid.county_Array.count > 0) { //说明有县区
        [self.navigationController pushViewController:thrid animated:YES];
//        self.dingweiName.text = [NSString stringWithFormat:@"%@ . %@",self.province, thrid.select_area];
        
    }else{
        for (UIViewController * vc in self.navigationController.viewControllers) {
            if ([vc isKindOfClass:[ViewController class]]) {
//                [self.navigationController popViewControllerAnimated:YES];
                  self.dingweiName.text = [NSString stringWithFormat:@"%@ . %@",self.province, thrid.select_area];
            }
        }
    
    }
}

@end
