//
//  HZSuccessVCViewController.m
//  QHXPasswordTextField
//
//  Created by apple on 2017/8/26.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "HZSuccessVCViewController.h"
/**比例适配*/
#define MAINCOLOR [UIColor whileColor]
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568

#define kLineColor  [UIColor lightGrayColor]   //横线颜色



//取消按钮
#define kCancelTitleColor  [UIColor blackColor]   //取消按钮颜色
#define kCancelTitleSize    17          //字体
#define kCancelBackgroundColor   [UIColor clearColor]       //按钮背景色
#define kCancelRadius  4      //按钮弧度
#define kCancelBorderColor  [UIColor grayColor]    //边框颜色
#define kCancelBorderWidth  0.5         //边框宽度
#define kBtnHeight  44      //按钮高度
#define kBtnEdgeLeft  15    //左边距

//确定按钮
#define kSureTitleColor  [UIColor blackColor]
#define kSureTitleSize    17
#define kSureBackgroundColor   [UIColor clearColor]
#define kSureRadius  4
#define kSureBorderColor  [UIColor lightGrayColor]
#define kSurelBorderWidth  0.5

@interface HZSuccessVCViewController ()
@property(nonatomic,strong)UIImageView *SuccessImageView;
@property(nonatomic,strong)UILabel *amountMoneyLable;
@property(nonatomic,strong)UILabel *displayAmountLable;
@property(nonatomic,strong)UIButton * cancelBtn;
@property(nonatomic,strong)UIButton * sureBtn;
@end

@implementation HZSuccessVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = self.navTitleSTR;
  //    self.title=@"";
     self.amountMoneyLable.text =@"+10000.00"; // self.soneySTR 金额
    self.displayAmountLable.text = @"充值成功，当前可用余额10012.00元"; ///self.displayAmountSTR
    
    
    
    [self setUI]; ///添加控件
}
-(void)setUI
{

    [self.view addSubview:self.SuccessImageView];
     [self.view addSubview:self.amountMoneyLable];
     [self.view addSubview:self.displayAmountLable];
    [self.view addSubview:self.cancelBtn];
    [self.view addSubview:self.sureBtn];
     _SuccessImageView.frame= CGRectMake((SCREEN_W-72*WIDTH)/2, SCREEN_H*0.2 -20*HEIGHT,72*WIDTH, 72*HEIGHT);
        self.amountMoneyLable.frame =  CGRectMake(0, CGRectGetMaxY(self.SuccessImageView.frame) +20*HEIGHT, SCREEN_W, 40*HEIGHT);
    
    self.displayAmountLable.frame =  CGRectMake(0, CGRectGetMaxY(self.amountMoneyLable.frame) +10*HEIGHT, SCREEN_W, 30*HEIGHT);
    
    
    if (self.displayAmountLable.text == nil) {
        self.cancelBtn.frame = CGRectMake(SCREEN_W/2 , CGRectGetMaxY(self.amountMoneyLable.frame)+20*HEIGHT, SCREEN_W/2 -50*WIDTH, 40*HEIGHT);
        //双按钮
        self.sureBtn.frame = CGRectMake(30*WIDTH, CGRectGetMaxY(self.amountMoneyLable.frame)+20*HEIGHT, SCREEN_W/2 -50*WIDTH, 40*HEIGHT);
        
    }
    else
    {
      self.cancelBtn.frame = CGRectMake(SCREEN_W/2 , CGRectGetMaxY(self.displayAmountLable.frame)+20*HEIGHT, SCREEN_W/2 -50*WIDTH, 40*HEIGHT);
    //双按钮
    self.sureBtn.frame = CGRectMake(30*WIDTH, CGRectGetMaxY(self.displayAmountLable.frame)+20*HEIGHT, SCREEN_W/2 -50*WIDTH, 40*HEIGHT);
  
    }
}
//成功图片控件
-(UIImageView *)SuccessImageView
{
    if (!_SuccessImageView) {
        _SuccessImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"成功1x"]];
    }
    return _SuccessImageView;
}
///充值金额
-(UILabel *)amountMoneyLable
{
    if (!_amountMoneyLable) {
        _amountMoneyLable = [[UILabel alloc]init] ;
        _amountMoneyLable.textAlignment = NSTextAlignmentCenter;
        _amountMoneyLable.font = [UIFont systemFontOfSize:35];
        _amountMoneyLable.textColor = [UIColor colorWithRed:25/255.0 green:175/255.0 blue:29/255.0 alpha:1] ;
    }
    return _amountMoneyLable;
}
///当前金额
-(UILabel *)displayAmountLable
{
    if (!_displayAmountLable) {
        _displayAmountLable = [[UILabel alloc]init] ;
        _displayAmountLable.textAlignment = NSTextAlignmentCenter;
        _displayAmountLable.font = [UIFont systemFontOfSize:17];
        _displayAmountLable.textColor = [UIColor grayColor];
    }
    return _displayAmountLable;
}

///立即投资cancelTitleSTR
- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [self buttonWithTitle:@"立即投资" titleColor:kCancelTitleColor titleFont:[UIFont systemFontOfSize:kCancelTitleSize] titleBackground:kCancelBackgroundColor btnCornerRadius:kCancelRadius borderColor:kCancelBorderColor borderWith:kCancelBorderWidth buttonSelector:@selector(BtnPressed:)];
        
      
        _cancelBtn.tag = 1990;
        
    }
    return _cancelBtn;
}


///确定 selfsureBtnTitleSTR
- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [self buttonWithTitle:@"确定" titleColor:kSureTitleColor titleFont:[UIFont systemFontOfSize:kSureTitleSize] titleBackground:kSureBackgroundColor btnCornerRadius:kSureRadius borderColor:kSureBorderColor borderWith:kSurelBorderWidth buttonSelector:@selector(BtnPressed:)];

      
        
        _sureBtn.tag = 1991;
        
    }
    return _sureBtn;
}

- (UIButton *)buttonWithTitle:(NSString *)btnTitle titleColor:(UIColor *)titleColor titleFont:(UIFont *)titleFont titleBackground:(UIColor *)titleBackground btnCornerRadius:(CGFloat)radius borderColor:(UIColor *)borderColor borderWith:(CGFloat)borderWidth buttonSelector:(SEL)buttonSelector{
    UIButton *btn = [[UIButton alloc] init];
    //btn.frame = frame;
    [btn setTitle:btnTitle forState:UIControlStateNormal];
    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    btn.titleLabel.font = titleFont;
    btn.backgroundColor = titleBackground;
    btn.layer.cornerRadius = radius;
    btn.layer.borderColor = borderColor.CGColor;
    btn.layer.borderWidth = borderWidth;
    btn.layer.masksToBounds = YES;
    [btn addTarget:self action:buttonSelector forControlEvents:UIControlEventTouchUpInside];
    
    return btn;
}



- (void)BtnPressed:(UIButton *)sender{
    
    if (sender.tag == 1990) {
        NSLog(@"立即投资");
    }
    else
    {
        NSLog(@"确定");
        
        [self.navigationController popViewControllerAnimated:YES];
    }
}










@end
