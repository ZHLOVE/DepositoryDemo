//
//  HZModifyBankCardVC.m
//  QHXPasswordTextField
//
//  Created by 李忠华 on 2017/8/28.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "HZModifyBankCardVC.h"
#import "HZOpenDepositAccountVC.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568
@interface HZModifyBankCardVC ()
@property(nonatomic,strong) UIView *toPBackView;
@property(nonatomic,strong) UIImageView *bankCardImageView;
@property(nonatomic,strong)UILabel *bankCardNameLable;
@property(nonatomic,strong)UILabel *bankCardNumberLable;
@property(nonatomic,strong)UITextView *PresentContentTextView;
@property(nonatomic,strong)UIButton * nextBut;
@property(nonatomic,strong)UIImageView *bankOfShanghaiTitle;
@property(nonatomic,strong)UIImageView *TitleImageView;
@end

@implementation HZModifyBankCardVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [ UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];

    self.bankCardNameLable.text = @"中国农业银行";
    self.bankCardNumberLable.text =@"6216 **** **** **** 6153";
    
//     self.PresentContentTextView.text =@"账户充值不收取任何手续费，平台第三方账户由富友支付作为资金支付通道，保障资金安全";
    self.PresentContentTextView.text =@"您已开通上海银行开通资金存管账户并绑定银行卡,可以放心充值,提现,投资";

    [self setUI];

}

-(void)setUI
{
    [self.view addSubview:self.toPBackView];
    [self.toPBackView addSubview:self.bankCardImageView];
    [self.bankCardImageView addSubview:self.bankCardNameLable];
    [self.bankCardImageView addSubview:self.bankCardNumberLable];
    [self.view addSubview:self.PresentContentTextView];
    [self.view addSubview:self.TitleImageView];
    
    [self.view addSubview:self.nextBut];
    [self.view addSubview:self.bankOfShanghaiTitle];
    

}
-(UIView *)toPBackView
{
    if (!_toPBackView) {
        _toPBackView = [[UIView alloc]init];
        _toPBackView.backgroundColor = [UIColor whiteColor];
        _toPBackView.frame = CGRectMake(0, 105*HEIGHT, SCREEN_W, 119*HEIGHT);
    }
    return _toPBackView;
}


-(UIImageView *)bankCardImageView
{
    if (!_bankCardImageView) {
        _bankCardImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"银联1x"]];
        _bankCardImageView.frame = CGRectMake(15*WIDTH, 19*HEIGHT, SCREEN_W -30*WIDTH, 81*HEIGHT);
        
    }
    return _bankCardImageView;
}
///银行名称
-(UILabel *)bankCardNameLable
{
    if (!_bankCardNameLable) {
        _bankCardNameLable = [[UILabel alloc] initWithFrame:CGRectMake(10*WIDTH, 20*HEIGHT, 200*WIDTH, 20*HEIGHT)];
        _bankCardNameLable.font = [UIFont systemFontOfSize:15];
        _bankCardNameLable.textColor = [UIColor whiteColor];
        
    }
    return _bankCardNameLable;
}




///银行卡号码
-(UILabel *)bankCardNumberLable
{
    if (!_bankCardNumberLable) {
        _bankCardNumberLable = [[UILabel alloc] initWithFrame:CGRectMake(10*WIDTH, 45*HEIGHT, 200*WIDTH, 20*HEIGHT)];
        _bankCardNumberLable.font = [UIFont systemFontOfSize:15];
        _bankCardNumberLable.textColor = [UIColor whiteColor];
        
    }
    return _bankCardNumberLable;
}


-(UITextView *)PresentContentTextView
{
    if(!_PresentContentTextView)
    {
        _PresentContentTextView = [[UITextView alloc]initWithFrame:CGRectMake(15*WIDTH,60*HEIGHT, SCREEN_W-30*WIDTH, 43*HEIGHT)];
        _PresentContentTextView.textColor = [UIColor grayColor];
        _PresentContentTextView.backgroundColor =[ UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
        _PresentContentTextView.showsVerticalScrollIndicator = NO;
        _PresentContentTextView.showsHorizontalScrollIndicator = NO;
        _PresentContentTextView.selectable  =NO;
        _PresentContentTextView.editable = NO;
        [_PresentContentTextView setFont:[UIFont fontWithName:@"Arial" size:12]];
        //        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        //        paragraphStyle.lineSpacing = 10;// 字体的行间距
        //
        //        NSDictionary *attributes = @{
        //                                     NSFontAttributeName:[UIFont systemFontOfSize:15],
        //                                     NSParagraphStyleAttributeName:paragraphStyle
        //                                     };
        //        _PresentContentTextView.attributedText = [[NSAttributedString alloc] initWithString: self.PresentContentTextView.text  attributes:attributes];
    }
    return _PresentContentTextView;
}
///上海银行logo
-(UIImageView *)bankOfShanghaiTitle
{
    if (!_bankOfShanghaiTitle) {
        _bankOfShanghaiTitle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LOGO.1x"]];
        _bankOfShanghaiTitle.frame = CGRectMake(40*WIDTH, SCREEN_H -100*HEIGHT, 250*WIDTH, 41*HEIGHT);
        
    }
    return _bankOfShanghaiTitle;
}


-(UIImageView *)TitleImageView
{
    if (!_TitleImageView) {
        _TitleImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"上海银行存管LOGO.1x"]];
        _TitleImageView.frame = CGRectMake(40*WIDTH, SCREEN_H -250*HEIGHT, 250*WIDTH, 24*HEIGHT);
        
    }
    return _TitleImageView;
}
-(UIButton *)nextBut
{
    if (!_nextBut) {
        _nextBut = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_H -44*HEIGHT, SCREEN_W, 44*HEIGHT)];
        _nextBut.backgroundColor = [UIColor colorWithRed:15/255.0 green:114/255.0 blue:253/255.0 alpha:1];
        [_nextBut setTitle:@"修改银行卡" forState:0];
        _nextBut.titleLabel.textColor = [UIColor whiteColor];
        _nextBut.layer.masksToBounds = YES;
        _nextBut.layer.cornerRadius = 0 ;
        [_nextBut addTarget:self action:@selector(nextButCilck) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBut;
}
#pragma mark -按钮点击方法
///下一步
-(void)nextButCilck
{
    
    HZOpenDepositAccountVC *vc  = [[HZOpenDepositAccountVC alloc]init];
    vc.title = @"开通存管账户";
    [self.navigationController pushViewController:vc animated:YES];
  
    
}


















@end
