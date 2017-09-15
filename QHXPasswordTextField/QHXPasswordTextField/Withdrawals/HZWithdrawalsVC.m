//
//  HZRechargeVC.m
//  QHXPasswordTextField
//
//  Created by apple on 2017/8/26.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "HZWithdrawalsVC.h"
#import "HZSuccessVCViewController.h"

#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568
@interface HZWithdrawalsVC () <UITextFieldDelegate>
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
@property(nonatomic,strong)UIButton *allBut;
@property(nonatomic,strong)UIButton * nextBut;

@property(nonatomic,strong)UITextView *textIntroduceView;

@property(nonatomic,strong)UILabel * wenxiTiShiLable;

///提现类型按钮
@property(nonatomic,strong)UIButton *ordinaryCashWithdrawalBut;
@property(nonatomic,strong)UIButton *urgentCashWithdrawalBut;
@property(nonatomic,strong) UIImageView *tishimageView;
@property(nonatomic,strong)UITextView *PresentContentTextView;

@property(nonatomic,strong)UIButton *SelectedCashWithdrawalBut;

@end

@implementation HZWithdrawalsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [ UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1];
    self.bankCardNameLable.text = @"中国农业银行";
    self.bankCardNumberLable.text =@"6216 **** **** **** 6153";
    
    self.textIntroduceView.text =@"账户充值不收取任何手续费，平台第三方账户由富友支付作为资金支付通道，保障资金安全，如有疑问请联系客服400-139-8081";
    self.PresentContentTextView.text =@"账户充值不收取任何手续费，平台第三方账户由富友支付作为资金支付通道，保障资金安全，";
    [self setUI];
    
    
    NSString *name = @"100";
    
    
    NSString *dataString = [NSString stringWithFormat:@"%@",name];
    NSString *textString = [NSString stringWithFormat:@"可用余额:%@元",dataString];
    NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:textString];
//    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor]] range:NSMakeRange(0,4)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(5,dataString.length)];
    [str addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(5+dataString.length,1)];
    self.self.moneyNuberLable.attributedText = str;
    [self.self.moneyNuberLable sizeToFit];

    
    
    
    //图像添加点击事件（手势方法）
    self.view.userInteractionEnabled = YES;
    UITapGestureRecognizer * PrivateLetterTap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAvatarView:)];
    PrivateLetterTap.numberOfTouchesRequired = 1; //手指数
    PrivateLetterTap.numberOfTapsRequired = 1; //tap次数
    
    [self.view addGestureRecognizer:PrivateLetterTap];
    

    
    self.allBut.hidden = NO;
    self.canBut.hidden = YES;
    
}
- (void)tapAvatarView: (UITapGestureRecognizer *)gesture
{
    [self.view endEditing:YES];
//    [self.moneyTextFieldView resignFirstResponder];
    
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
    
    [self.bottomBackView addSubview:self.tishimageView];
    [self.bottomBackView addSubview:self.PresentContentTextView];

    
    [self.borberView addSubview:self.allBut];
    [self.borberView addSubview:self.canBut];

    [self.bottomBackView addSubview:self.ordinaryCashWithdrawalBut];
    [self.bottomBackView addSubview:self.urgentCashWithdrawalBut];
    [self.view addSubview:self.wenxiTiShiLable];
    [self.view addSubview:self.textIntroduceView];
    [self.view addSubview:self.nextBut];
    
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
        _bottomBackView.frame = CGRectMake(0, CGRectGetMaxY(self.toPBackView.frame) +5, SCREEN_W, 220*HEIGHT);
    }
    return _bottomBackView;
}




///充值金额(元)
-(UILabel *)moneyNuberLable
{
    if (!_moneyNuberLable) {
        _moneyNuberLable = [[UILabel alloc] initWithFrame:CGRectMake(15*WIDTH, 20*HEIGHT, 140*WIDTH, 20*HEIGHT)];
        _moneyNuberLable.font = [UIFont systemFontOfSize:15];
        _moneyNuberLable.textColor = [UIColor grayColor];
        _moneyNuberLable.textAlignment = NSTextAlignmentLeft;
     
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
        _jinELable.text = @"提现金额不能小于100元";
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
        _moneyTextFieldView.delegate = self;
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

-(UIButton *)allBut
{
    if (!_allBut) {
        _allBut = [[UIButton alloc]initWithFrame:CGRectMake(self.borberView.frame.size.width -60*WIDTH, 0*HEIGHT, 60*WIDTH, 50*HEIGHT)];
        [_allBut setTitle:@"全提" forState:UIControlStateNormal];
        [_allBut setTitleColor:[UIColor colorWithRed:18/255.0 green:133/255.0 blue:254/255.0 alpha:1] forState:UIControlStateNormal];
        [_allBut addTarget:self action:@selector(allButtextvalue) forControlEvents:UIControlEventTouchUpInside];
    }
    return _allBut;
}

-(UIButton *)ordinaryCashWithdrawalBut
{
    if (!_ordinaryCashWithdrawalBut) {
        _ordinaryCashWithdrawalBut = [[UIButton alloc]initWithFrame:CGRectMake(15*WIDTH, CGRectGetMaxY(self.borberView.frame)+15*HEIGHT,  110*WIDTH, 40*HEIGHT)];
        _ordinaryCashWithdrawalBut.backgroundColor = [UIColor whiteColor];
        _ordinaryCashWithdrawalBut.tag = 100;
        _ordinaryCashWithdrawalBut.selected = YES;
        self.SelectedCashWithdrawalBut = _ordinaryCashWithdrawalBut;
        [_ordinaryCashWithdrawalBut setTitle:@"普通提现" forState:0];
//        _ordinaryCashWithdrawalBut.titleLabel.textColor = [UIColor grayColor];
          [_ordinaryCashWithdrawalBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_ordinaryCashWithdrawalBut setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        _ordinaryCashWithdrawalBut.layer.masksToBounds = YES;
        _ordinaryCashWithdrawalBut.layer.cornerRadius = 4 ;
        _ordinaryCashWithdrawalBut.layer.borderColor = [UIColor blueColor].CGColor;
        _ordinaryCashWithdrawalBut.layer.borderWidth = 1;
        [_ordinaryCashWithdrawalBut addTarget:self action:@selector(urgentCashWithdrawalButClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _ordinaryCashWithdrawalBut;
}

-(UIButton *)urgentCashWithdrawalBut
{
    if (!_urgentCashWithdrawalBut) {
        _urgentCashWithdrawalBut = [[UIButton alloc]initWithFrame:CGRectMake(160*WIDTH, CGRectGetMaxY(self.borberView.frame)+15*HEIGHT, 110*WIDTH, 40*HEIGHT)];
        _urgentCashWithdrawalBut.backgroundColor = [UIColor whiteColor];
        _urgentCashWithdrawalBut.tag = 200;
        [_urgentCashWithdrawalBut setTitle:@"加急提现" forState:0];
        [_urgentCashWithdrawalBut setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_urgentCashWithdrawalBut setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
        _urgentCashWithdrawalBut.layer.borderColor = [UIColor grayColor].CGColor;
        _urgentCashWithdrawalBut.layer.borderWidth = 1;
        _urgentCashWithdrawalBut.layer.masksToBounds = YES;
        _urgentCashWithdrawalBut.layer.cornerRadius = 4 ;
        [_urgentCashWithdrawalBut addTarget:self action:@selector(urgentCashWithdrawalButClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _urgentCashWithdrawalBut;
}
-(UIImageView *)tishimageView
{
    if (!_tishimageView) {
        _tishimageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"注意1x"]];
        _tishimageView.frame = CGRectMake(15*WIDTH, CGRectGetMaxY(self.ordinaryCashWithdrawalBut.frame)+10*HEIGHT, 12*WIDTH, 12*HEIGHT);
        
    }
    return _tishimageView;
}

-(UIButton *)nextBut
{
    if (!_nextBut) {
        _nextBut = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_H -44*HEIGHT, SCREEN_W, 44*HEIGHT)];
        _nextBut.backgroundColor = [UIColor colorWithRed:112/255.0 green:183/255.0 blue:255.0 alpha:1];
        [_nextBut setTitle:@"确认提现" forState:0];
        _nextBut.titleLabel.textColor = [UIColor whiteColor];
        _nextBut.layer.masksToBounds = YES;
        _nextBut.layer.cornerRadius = 0 ;
        [_nextBut addTarget:self action:@selector(nextButCilck) forControlEvents:UIControlEventTouchUpInside];
    }
    return _nextBut;
}


-(UITextView *)PresentContentTextView
{
    if(!_PresentContentTextView)
    {
        _PresentContentTextView = [[UITextView alloc]initWithFrame:CGRectMake(27*WIDTH,CGRectGetMaxY(self.ordinaryCashWithdrawalBut.frame)+5*HEIGHT, SCREEN_W-40*WIDTH, 50*HEIGHT)];
        _PresentContentTextView.textColor = [UIColor grayColor];
        _PresentContentTextView.backgroundColor =[ UIColor whiteColor];
        _PresentContentTextView.showsVerticalScrollIndicator = NO;
        _PresentContentTextView.showsHorizontalScrollIndicator = NO;
        _PresentContentTextView.selectable  =NO;
        _PresentContentTextView.editable = NO;
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
///温馨提示
-(UILabel *)wenxiTiShiLable
{
    if (!_wenxiTiShiLable) {
        _wenxiTiShiLable =  [[UILabel alloc]initWithFrame:CGRectMake(15*WIDTH, CGRectGetMaxY(self.bottomBackView.frame)+10*HEIGHT, 100*WIDTH, 25*HEIGHT)];
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
    if(self.moneyTextFieldView.text.length>0)
    {
        [self.nextBut setBackgroundColor:[UIColor colorWithRed:5/255.0 green:155/255.0 blue:254/255.0 alpha:1]];
        [self.nextBut setBackgroundColor:[UIColor colorWithRed:5/255.0 green:155/255.0 blue:254/255.0 alpha:1]];
        self.allBut.hidden = YES;
        self.canBut.hidden = NO;
    }
    else
    {
        self.nextBut.backgroundColor = [UIColor colorWithRed:112/255.0 green:183/255.0 blue:255.0 alpha:1];
        self.allBut.hidden = NO;
        self.canBut.hidden = YES;
        
    }

    
}
-(void)allButtextvalue
{
    self.moneyTextFieldView.text = @"100";
    
    if(self.moneyTextFieldView.text.length>0)
    {
        [self.nextBut setBackgroundColor:[UIColor colorWithRed:5/255.0 green:155/255.0 blue:254/255.0 alpha:1]];
        self.allBut.hidden = YES;
        self.canBut.hidden = NO;
    }
    else
    {
        self.nextBut.backgroundColor = [UIColor colorWithRed:112/255.0 green:183/255.0 blue:255.0 alpha:1];
        self.allBut.hidden = NO;
        self.canBut.hidden = YES;
    }

    
}
///下一步
-(void)nextButCilck
{
    if (self.moneyTextFieldView.text == nil) {
        NSLog(@"请输入充值金额");
        return;
    }
       
}

-(void)urgentCashWithdrawalButClick:(UIButton *)sender
{

    
    self.SelectedCashWithdrawalBut.selected=!self.SelectedCashWithdrawalBut.selected;
    //选中的当前按钮
    sender.selected=!sender.selected;
    //记录当前按钮被选中
    self.SelectedCashWithdrawalBut=sender;
    
 
        if (self.SelectedCashWithdrawalBut.selected == YES) {

            
            if (sender.tag == 100) {
                self.ordinaryCashWithdrawalBut.layer.borderColor = [UIColor blueColor].CGColor;
                self.urgentCashWithdrawalBut.layer.borderColor = [UIColor grayColor].CGColor;

            } else if (sender.tag == 200)
            
            {
                self.ordinaryCashWithdrawalBut.layer.borderColor = [UIColor grayColor].CGColor;
                self.urgentCashWithdrawalBut.layer.borderColor = [UIColor blueColor].CGColor;
            }
            

    
        }
       
   
}





-(void)textFieldDidChange :(UITextField *)theTextField{
    NSLog( @"text changed: %@", theTextField.text);
    
    if(theTextField.text.length>0)
    {
        [self.nextBut setBackgroundColor:[UIColor colorWithRed:5/255.0 green:155/255.0 blue:254/255.0 alpha:1]];
        self.allBut.hidden = YES;
        self.canBut.hidden = NO;
    }
    else
    {
        self.nextBut.backgroundColor = [UIColor colorWithRed:112/255.0 green:183/255.0 blue:255.0 alpha:1];
        self.allBut.hidden = NO;
        self.canBut.hidden = YES;
    }
}
-(void)dealloc
{
    self.moneyTextFieldView.delegate = nil;
   
}



@end
