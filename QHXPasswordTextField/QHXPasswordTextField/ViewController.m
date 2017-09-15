//
//  ViewController.m
//  QHXPasswordTextField
//
//  Created by qhx on 2017/7/25.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "ViewController.h"
#import "PasswordView.h"
#import "HZSuccessVCViewController.h"
#import "HZEeeorVC.h"
#import "HZRechargeVC.h"
#import "HZWithdrawalsVC.h"
#import "HZModifyBankCardVC.h"
#import "ListofnetworkoperatorsVC.h"

#import "HZRegionalChoiceVC.h"
#import "HZOpenAccountVC.h"
@interface ViewController (){
    UIButton *btn;
    PasswordView *passView;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self alertShow];
}

- (void)alertShow{
    btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 120, 60)];
    btn.center = self.view.center;
    [btn setTitle:@"click me!" forState:UIControlStateNormal];
    
    [btn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:17];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(btnPressed:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)btnPressed:(id)sender{
    passView = [[PasswordView alloc] initWithTitle:@"请输入短信验证码" cancelBtn:@"取消" sureBtn:@"确定" btnClickBlock:^(NSInteger index,NSString *str) {
        if (index == 0) {
            NSLog(@"%@",str);
        }else if (index == 1){
             NSLog(@"........%@",str);
        }
    }];
    [passView show];
}
///成功demo
- (IBAction)SuccessClick:(id)sender {
    HZSuccessVCViewController *vc = [[HZSuccessVCViewController alloc] init];
     vc.title = @"充值成功";
    [self.navigationController pushViewController:vc animated:YES];
}
- (IBAction)eleerClick:(id)sender {
    HZEeeorVC *vc = [[HZEeeorVC alloc] init];
    vc.title = @"充值失败";
    [self.navigationController pushViewController:vc animated:YES];

}
- (IBAction)chongzhiButClick:(id)sender {
    HZRechargeVC *vc  = [[HZRechargeVC alloc] init];
    vc.title  = @"充值";
    [self.navigationController pushViewController:vc animated:vc];
}


///提现
- (IBAction)WithdrawalsBut:(id)sender {
    
    
    HZWithdrawalsVC *vc  = [[HZWithdrawalsVC alloc] init];
    vc.title  = @"提现";
    [self.navigationController pushViewController:vc animated:vc];

}

///修改银行卡
- (IBAction)ModifyBankCardClick:(id)sender {
    HZModifyBankCardVC *vc = [[HZModifyBankCardVC alloc]init];
    vc.title = @"银行卡";
    [self.navigationController pushViewController:vc animated:YES];
}

///地址选择
- (IBAction)RegionalChoiceClick:(id)sender {
    HZRegionalChoiceVC * vc = [[HZRegionalChoiceVC alloc]init];
    vc.title = @"地址选择";
    [self.navigationController pushViewController:vc animated:YES];
}


///银行卡及限额
- (IBAction)xuanZheJIXianEClick:(id)sender {
    ListofnetworkoperatorsVC * vc  = [[ListofnetworkoperatorsVC alloc ] init];
    vc.title =@"银行卡及限额";
    [self.navigationController pushViewController:vc animated:YES];
}
///开通存管账户
- (IBAction)kaitongCunguanACCClick:(id)sender {
    HZOpenAccountVC *vc  = [[HZOpenAccountVC alloc] init];
    vc.title = @"开通存管账户";
    [self.navigationController pushViewController:vc animated:YES];
}








@end
