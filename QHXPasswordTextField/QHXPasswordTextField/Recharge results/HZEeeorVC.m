//
//  HZEeeorVC.m
//  QHXPasswordTextField
//
//  Created by apple on 2017/8/26.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "HZEeeorVC.h"
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

@interface HZEeeorVC ()
@property(nonatomic,strong)UIImageView *SuccessImageView;
//@property(nonatomic,strong)UILabel *amountMoneyLable;
@property(nonatomic,strong)UILabel *displayAmountLable;
@property(nonatomic,strong)UIButton * cancelBtn;
@property(nonatomic,strong)UIButton * sureBtn;
@end

@implementation HZEeeorVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    self.displayAmountLable.text = @"充值失败，请联系客服400-138-8081";
    
    
    
    [self setUI]; ///添加控件
}
-(void)setUI
{
    
    [self.view addSubview:self.SuccessImageView];
//    [self.view addSubview:self.amountMoneyLable];
    [self.view addSubview:self.displayAmountLable];
    [self.view addSubview:self.cancelBtn];
    [self.view addSubview:self.sureBtn];
    
    
    
    
}
//成功图片控件
-(UIImageView *)SuccessImageView
{
    if (!_SuccessImageView) {
        _SuccessImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"失败1x"]];
        _SuccessImageView.frame= CGRectMake((SCREEN_W-72*WIDTH)/2, SCREEN_H*0.2 -20*HEIGHT,72*WIDTH, 72*HEIGHT);
    }
    return _SuccessImageView;
}
/////充值金额
//-(UILabel *)amountMoneyLable
//{
//    if (!_amountMoneyLable) {
//        _amountMoneyLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.SuccessImageView.frame) +20*HEIGHT, SCREEN_W, 40*HEIGHT)] ;
//        _amountMoneyLable.textAlignment = NSTextAlignmentCenter;
//        _amountMoneyLable.font = [UIFont systemFontOfSize:35];
//        _amountMoneyLable.textColor = [UIColor colorWithRed:25/255.0 green:175/255.0 blue:29/255.0 alpha:1] ;
//    }
//    return _amountMoneyLable;
//}
///充值失败
-(UILabel *)displayAmountLable
{
    if (!_displayAmountLable) {
        _displayAmountLable = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(self.SuccessImageView.frame) +20*HEIGHT, SCREEN_W, 30*HEIGHT)] ;
        _displayAmountLable.textAlignment = NSTextAlignmentCenter;
        _displayAmountLable.font = [UIFont systemFontOfSize:17];
        _displayAmountLable.textColor = [UIColor redColor];
    }
    return _displayAmountLable;
}

///在试一次
- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [self buttonWithTitle:@"在试一次" titleColor:kCancelTitleColor titleFont:[UIFont systemFontOfSize:kCancelTitleSize] titleBackground:kCancelBackgroundColor btnCornerRadius:kCancelRadius borderColor:kCancelBorderColor borderWith:kCancelBorderWidth buttonSelector:@selector(BtnPressed:)];
        _cancelBtn.frame = CGRectMake(SCREEN_W/2 , CGRectGetMaxY(self.displayAmountLable.frame)+20*HEIGHT, SCREEN_W/2 -50*WIDTH, 40*HEIGHT);
        
        _cancelBtn.tag = 1000;
        
    }
    return _cancelBtn;
}


///取消
- (UIButton *)sureBtn{
    if (!_sureBtn) {
        _sureBtn = [self buttonWithTitle:@"取消" titleColor:kSureTitleColor titleFont:[UIFont systemFontOfSize:kSureTitleSize] titleBackground:kSureBackgroundColor btnCornerRadius:kSureRadius borderColor:kSureBorderColor borderWith:kSurelBorderWidth buttonSelector:@selector(BtnPressed:)];
        
        //双按钮
        _sureBtn.frame = CGRectMake(30*WIDTH, CGRectGetMaxY(self.displayAmountLable.frame)+20*HEIGHT, SCREEN_W/2 -50*WIDTH, 40*HEIGHT);
        
        _sureBtn.tag = 1001;
        
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
    
    if (sender.tag == 1000) {
        NSLog(@"在试一次");
    }
    else
    {
        NSLog(@"取消");
        [self.navigationController popViewControllerAnimated:YES];
    }
}




@end
