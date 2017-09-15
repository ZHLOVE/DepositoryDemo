//
//  HZRechargeVC.m
//  QHXPasswordTextField
//
//  Created by apple on 2017/8/26.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "HZRechargeVC.h"


#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568
@interface HZRechargeVC ()<UITextFieldDelegate>
@property(nonatomic,strong) UIView *toPBackView;
@property(nonatomic,strong) UIImageView *bankCardImageView;
@property(nonatomic,strong)UILabel *bankCardNameLable;
@property(nonatomic,strong)UILabel *bankCardNumberLable;

///底部
@property(nonatomic,strong) UIView *bottomBackView;
@property(nonatomic,strong)UILabel *moneyNuberLable;
@property(nonatomic,strong)UILabel *jinELable;
@property(nonatomic,strong)UIView * borberView;
@property(nonatomic,strong)UITextField * moneyTextFieldView;
@property(nonatomic,strong)UIButton * canBut;
@property(nonatomic,strong)UIButton * nextBut;

@property(nonatomic,strong)UITextView *textIntroduceView;

@property(nonatomic,strong)UILabel * wenxiTiShiLable;
@end

@implementation HZRechargeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [ UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    self.bankCardNameLable.text = @"中国农业银行";
    self.bankCardNumberLable.text =@"6216 **** **** **** 6153";
    
    self.textIntroduceView.text =@"账户充值不收取任何手续费，平台第三方账户由富友支付作为资金支付通道，保障资金安全，如有疑问请联系客服400-139-8081";
    [self setUI];
    
    //图像添加点击事件（手势方法）
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAvatarView:)];
    PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
    PrivateLetterTap.numberOfTapsRequired = 1; //tap次数

    [self.view addGestureRecognizer:PrivateLetterTap];
    

}
- (void)tapAvatarView: (UITapGestureRecognizer *)gesture
{
    [self.view endEditing:YES] ;
    [self.moneyTextFieldView resignFirstResponder];
    
    }


-(void)setUI
{
    [self.view addSubview:self.toPBackView];
    [self.toPBackView addSubview:self.bankCardImageView];
    [self.bankCardImageView addSubview:self.bankCardNameLable];
    [self.bankCardImageView addSubview:self.bankCardNumberLable];
    
    [self.view addSubview:self.bottomBackView];
    [self.bottomBackView addSubview:self.moneyNuberLable];
    [self.bottomBackView addSubview:self.jinELable];
    [self.bottomBackView addSubview:self.borberView];
    [self.borberView addSubview:self.moneyTextFieldView];
    [self.borberView addSubview:self.canBut];
     [self.bottomBackView addSubview:self.nextBut];
    [self.view addSubview:self.wenxiTiShiLable];
     [self.view addSubview:self.textIntroduceView];

}
-(UIView *)toPBackView
{
    if (!_toPBackView) {
        _toPBackView = [[UIView alloc]init];
        _toPBackView.backgroundColor = [UIColor whiteColor];
        _toPBackView.frame = CGRectMake(0, 55*HEIGHT, SCREEN_W, 109*HEIGHT);
    }
    return _toPBackView;
}


-(UIImageView *)bankCardImageView
{
    if (!_bankCardImageView) {
        _bankCardImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"银联1x"]];
        _bankCardImageView.frame = CGRectMake(15*WIDTH, 14*HEIGHT, SCREEN_W -30*WIDTH, 81*HEIGHT);
        
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
///底部背景view
-(UIView *)bottomBackView
{
    if (!_bottomBackView) {
        _bottomBackView = [[UIView alloc]init];
        _bottomBackView.backgroundColor = [UIColor whiteColor];
        _bottomBackView.frame = CGRectMake(0, CGRectGetMaxY(self.toPBackView.frame)+5, SCREEN_W, 190*HEIGHT);
    }
    return _bottomBackView;
}




///充值金额(元)
-(UILabel *)moneyNuberLable
{
    if (!_moneyNuberLable) {
        _moneyNuberLable = [[UILabel alloc] initWithFrame:CGRectMake(15*WIDTH, 20*HEIGHT, 100*WIDTH, 20*HEIGHT)];
        _moneyNuberLable.font = [UIFont systemFontOfSize:15];
        _moneyNuberLable.textColor = [UIColor grayColor];
        _moneyNuberLable.textAlignment = NSTextAlignmentLeft;
        _moneyNuberLable.text = @"充值金额(元)";
    
    }
    return _moneyNuberLable;
}



///充值金额(元)
-(UILabel *)jinELable
{
    if (!_jinELable) {
        _jinELable = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_W-170*WIDTH, 20*HEIGHT, 155*WIDTH, 20*HEIGHT)];
        _jinELable.font = [UIFont systemFontOfSize:14];
        _jinELable.textColor = [UIColor grayColor];
        _jinELable.text = @"充值金额100元起";
        _jinELable.textAlignment = NSTextAlignmentRight;
    }
    return _jinELable;
}


-(UIView *)borberView
{
    if (!_borberView)
    {
        _borberView = [[UIView alloc]initWithFrame:CGRectMake(15*HEIGHT, 60*HEIGHT, SCREEN_W -30*WIDTH, 50*HEIGHT)];
        _borberView.backgroundColor = [UIColor whiteColor];
       
       
         _borberView.layer.cornerRadius = 4;
         _borberView.layer.borderColor = [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1].CGColor;
         _borberView.layer.borderWidth = 1;
         _borberView.layer.masksToBounds = YES;
    }
    return _borberView;
}

-(UITextField *)moneyTextFieldView
{
    if(!_moneyTextFieldView)
    {
        _moneyTextFieldView = [[UITextField alloc]initWithFrame:CGRectMake(10*WIDTH, 0, self.borberView.frame.size.width -70*WIDTH, 50*HEIGHT)];
        _moneyTextFieldView.placeholder = @" 请输入充值金额";
        _moneyTextFieldView.keyboardType = UIKeyboardTypeNumberPad;
//        _moneyTextFieldView.backgroundColor = [UIColor yellowColor];
        _moneyTextFieldView.delegate =self;
        
        [_moneyTextFieldView addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
       
        
    }
    return _moneyTextFieldView ;
}

-(UIButton *)canBut
{
    if (!_canBut) {
        _canBut = [[UIButton alloc]initWithFrame:CGRectMake(self.borberView.frame.size.width -60*WIDTH, 0*HEIGHT, 60*WIDTH, 50*HEIGHT)];
        [_canBut setImage:[UIImage imageNamed:@"叉1x"] forState:UIControlStateNormal];
        [_canBut addTarget:self action:@selector(cantextvalue) forControlEvents:UIControlEventTouchUpInside];
    }
    return _canBut;
}


-(UIButton *)nextBut
{
    if (!_nextBut) {
        _nextBut = [[UIButton alloc]initWithFrame:CGRectMake(15*WIDTH, CGRectGetMaxY(self.borberView.frame)+15*HEIGHT, SCREEN_W -30*WIDTH, 44*HEIGHT)];
        _nextBut.backgroundColor = [UIColor colorWithRed:112/255.0 green:183/255.0 blue:255.0 alpha:1];
        [_nextBut setTitle:@"下一步" forState:0];
        _nextBut.titleLabel.textColor = [UIColor whiteColor];
        _nextBut.layer.masksToBounds = YES;
        _nextBut.layer.cornerRadius = 4 ;
        [_nextBut addTarget:self action:@selector(nextButCilck) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBut;
}
///温馨提示
-(UILabel *)wenxiTiShiLable
{
    if (!_wenxiTiShiLable) {
        _wenxiTiShiLable =  [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH, CGRectGetMaxY(self.bottomBackView.frame)+20*HEIGHT, 100*WIDTH, 25*HEIGHT)];
        _wenxiTiShiLable.textColor  = [UIColor blackColor];
        _wenxiTiShiLable.font = [UIFont systemFontOfSize:17];
        _wenxiTiShiLable.text =@"温馨提示";
        
    }
    return _wenxiTiShiLable;
}

-(UITextView *)textIntroduceView
{
    if(!_textIntroduceView)
    {
        _textIntroduceView = [[UITextView alloc]initWithFrame:CGRectMake(15*WIDTH, CGRectGetMaxY(self.wenxiTiShiLable.frame), SCREEN_W-30*WIDTH, SCREEN_H -self.bottomBackView.frame.size.height)];
        _textIntroduceView.textColor = [UIColor grayColor];
        _textIntroduceView.backgroundColor =[ UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
       _textIntroduceView.showsVerticalScrollIndicator = NO;
        _textIntroduceView.showsHorizontalScrollIndicator = NO;
       _textIntroduceView.selectable  =NO;
        _textIntroduceView.editable = NO;
//        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//        paragraphStyle.lineSpacing = 10;// 字体的行间距
//        
//        NSDictionary *attributes = @{
//                                     NSFontAttributeName:[UIFont systemFontOfSize:15],
//                                     NSParagraphStyleAttributeName:paragraphStyle
//                                     };
//        _textIntroduceView.attributedText = [[NSAttributedString alloc] initWithString: self.textIntroduceView.text  attributes:attributes];
    }
    return _textIntroduceView;
}

#pragma mark -按钮点击方法


-(void)cantextvalue
{
    self.moneyTextFieldView.text = nil;
    
}

///下一步
-(void)nextButCilck
{
    if (self.moneyTextFieldView.text == nil) {
        NSLog(@"请输入充值金额");
        return;
    }
    
}







-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    
    if(theTextField.text.length>0)
    {
        [self.nextBut setBackgroundColor:[UIColor colorWithRed:5/255.0 green:155/255.0 blue:254/255.0 alpha:1]];
    }
    else
    {
        _nextBut.backgroundColor = [UIColor colorWithRed:112/255.0 green:183/255.0 blue:255.0 alpha:1];

    }
}
-(void)dealloc
{
    self.moneyTextFieldView.delegate = nil;
}










@end
