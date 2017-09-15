//
//  PasswordView.m
//  AllDemos
//
//  Created by qhx on 2017/7/21.
//  Copyright © 2017年 quhengxing. All rights reserved.
//

#import "PasswordView.h"

@interface PasswordView ()
@property (nonatomic, strong) UIButton *quabxiaolBtn;
//@property (nonatomic, strong) UIView *VerificationCodeView;
@property (nonatomic, strong)UIImageView *titleVeiw;
@property (nonatomic, strong) UIButton *cancelBtnnew;
@property (nonatomic, strong)UIButton *confirmBtn;
@property (nonatomic, strong) UIImageView *bjImageView;
@end
@implementation PasswordView

///弹框view
- (UIView *)alertView{
    if (!_alertView) {
        _alertView = [[UIView alloc] init];
        _alertView.layer.cornerRadius = kAlertViewRadius;
        _alertView.layer.masksToBounds = YES;
        _alertView.backgroundColor = [UIColor colorWithRed:247.0/255.0 green:247.0/255.0 blue:247.0/255.0 alpha:1];
        
    }
    return _alertView;
}
/////验证码view
//- (UIView *)VerificationCodeView{
//    if (!_VerificationCodeView) {
//        _VerificationCodeView = [[UIView alloc] init];
//        _VerificationCodeView.layer.cornerRadius = 4;
//        _VerificationCodeView.layer.masksToBounds = YES;
//        _VerificationCodeView.backgroundColor = [UIColor whiteColor];
//        _VerificationCodeView.layer.borderColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1].CGColor;
//        _VerificationCodeView.layer.borderWidth = 1;
//        
//    }
//    return _VerificationCodeView;
//}
/////标题
//- (UILabel *)titleLabel{
//    if (!_titleLabel) {
//        _titleLabel = [[UILabel alloc] init];
//        _titleLabel.font = [UIFont systemFontOfSize:kTitleFontSize];
//        _titleLabel.textColor = kTitleColor;
//        _titleLabel.textAlignment = NSTextAlignmentCenter;
//    }
//    return _titleLabel;
//}
//
/////手机号码
//- (UILabel *)pdhoneTextLable{
//    if (!_pdhoneTextLable) {
//        _pdhoneTextLable = [[UILabel alloc] init];
//        _pdhoneTextLable.font = [UIFont systemFontOfSize:16];
//        _pdhoneTextLable.textColor = [UIColor grayColor];
//        _pdhoneTextLable.text = [NSString stringWithFormat:@"已发送到你手机号码183****5218"];
//        _pdhoneTextLable.textAlignment = NSTextAlignmentCenter;
////        _pdhoneTextLable.backgroundColor = [UIColor yellowColor ];
//    }
//    return _pdhoneTextLable;
//}
//
//
/////文本框
//- (UITextField *)contentLabel{
//    if (!_contentLabel) {
//        _contentLabel = [[UITextField alloc] init];
//        _contentLabel.font = [UIFont systemFontOfSize:kContentFontSize];
//        _contentLabel.textColor = kContentColor;
////        _contentLabel.layer.borderWidth = kBorderwidth;
//        _contentLabel.placeholder = @"   请输入验证码";
//        _contentLabel.keyboardType = UIKeyboardTypeNumberPad;
//        [_contentLabel setFont:[UIFont fontWithName:@"Arial" size:15]];
//
////        _contentLabel.secureTextEntry = YES;
//    }
//    return _contentLabel;
//}
/////取消
//- (UIButton *)cancelBtn{
//    if (!_cancelBtn) {
//        _cancelBtn = [self buttonWithTitle:self.cancelStr titleColor:kCancelTitleColor titleFont:[UIFont systemFontOfSize:kCancelTitleSize] titleBackground:kCancelBackgroundColor btnCornerRadius:kCancelRadius borderColor:kCancelBorderColor borderWith:kCancelBorderWidth buttonSelector:@selector(BtnPressed:)];
//        _cancelBtn.tag = 1990;
//        
//    }
//    return _cancelBtn;
//}
//
//
/////确定
//- (UIButton *)sureBtn{
//    if (!_sureBtn) {
//        _sureBtn = [self buttonWithTitle:self.sureStr titleColor:kSureTitleColor titleFont:[UIFont systemFontOfSize:kSureTitleSize] titleBackground:kSureBackgroundColor btnCornerRadius:kSureRadius borderColor:kSureBorderColor borderWith:kSurelBorderWidth buttonSelector:@selector(BtnPressed:)];
//        _sureBtn.tag = 1991;
//        
//    }
//    return _sureBtn;
//}
/////获取验证码
//- (UIButton *)getCodeBtn{
//    if (!_getCodeBtn) {
//        _getCodeBtn = [self buttonWithTitle:self.cancelStr titleColor:kCancelTitleColor titleFont:[UIFont systemFontOfSize:kCancelTitleSize] titleBackground:[UIColor whiteColor] btnCornerRadius:0 borderColor:[UIColor whiteColor] borderWith:kCancelBorderWidth buttonSelector:@selector(getCodeBtnClick:)];
//        _getCodeBtn.tag = 1992;
//        [_getCodeBtn setTitle:@"获取验证码" forState:0];
//        
//    }
//    return _getCodeBtn;
//}

-(UIImageView *)titleVeiw
{
    if (!_titleVeiw ) {
        _titleVeiw=[[UIImageView alloc]init];
        _titleVeiw.userInteractionEnabled=YES;
        _titleVeiw.image=[UIImage imageNamed:@"弹窗.1x"];
       
    }
    return _titleVeiw;
}
-(UIButton *)cancelBtnnew
{
    if (!_cancelBtnnew) {
        ///取消按钮
        _cancelBtnnew = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [ _cancelBtnnew addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        [ _cancelBtnnew setImage:[UIImage imageNamed:@"弹窗叉1x"]forState:UIControlStateNormal];
       
    }
    return _cancelBtnnew;
}

-(UIButton *)confirmBtn
{
    if (_cancelBtn) {
        
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_cancelBtn setBackgroundColor:[UIColor whiteColor]];
        _cancelBtn.layer.cornerRadius = 5;
        [_cancelBtn addTarget:self action:@selector(saveClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [_cancelBtn setTitle:@"立即开通" forState:UIControlStateNormal];
    }
    return _confirmBtn;
}
- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(gogo:) name:@"keyboardAlertUp" object:nil];
    }
    return self;
}

- (void)gogo:(NSNotification *)sender{
    NSDictionary *dict = sender.userInfo;
    NSString *str = [dict objectForKey:@"keyboard"];
    if ([str isEqualToString:@"show"]) {
       self.alertView.frame = CGRectMake(kAlertViewEdgeLeft, (ScreenSizeHeight-150)/2-90, ScreenSizeWidth-kAlertViewEdgeLeft*2, kAlertViewHeight);
    }else if ([str isEqualToString:@"hidden"]){
       self.alertView.frame = CGRectMake(kAlertViewEdgeLeft, (ScreenSizeHeight-150)/2, ScreenSizeWidth-kAlertViewEdgeLeft*2, kAlertViewHeight); 
    }
}


- (id)initWithTitle:(NSString *)titleStr  cancelBtn:(NSString *)cancelBtn sureBtn:(NSString *)sureBtn btnClickBlock:(btnClickBlock)btnClickIndex{
    
    if (self = [super init]) {
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:.3];
        
        self.titleLabel.text = titleStr;
        self.cancelStr = cancelBtn;
        self.sureStr = sureBtn;
        self.btnClickBlock = [btnClickIndex copy];
        
        [self addSubview:self.alertView];
        
        
         [self.alertView addSubview:self.titleVeiw];
         [ self.alertView addSubview: self.cancelBtnnew];
        
        
      
        
   
        
        
        
//        UIView *bjView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleVeiw.frame) , 225, 102)];
//        [self addSubview:bjView];
//        bjView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bj1x"]];
        //        bjView.backgroundColor = [UIColor yellowColor];
        
      
        [self addSubview:self.confirmBtn];
        
        self.bjImageView = [[UIImageView alloc]init];
        self.bjImageView.image  = [UIImage imageNamed:@"上海银行logo"];
        [self addSubview:self.bjImageView];

        
        
        
        
        
        
        
        
        
        
        
        
//        [self.alertView addSubview:self.titleLabel];
//         [self.alertView addSubview:self.pdhoneTextLable];
//        
//
//        [self.alertView addSubview:self.VerificationCodeView]; ///验证码View
//        [self.VerificationCodeView addSubview:self.contentLabel];
//        [self.VerificationCodeView addSubview:self.getCodeBtn];
        
//        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
//                                                                              action:@selector(tapHandle:)];
//       
//        [self addGestureRecognizer:tap];
//
//        if (self.sureStr != nil) {
//            //双按钮
//            [self.alertView addSubview:self.cancelBtn];
//            
//            [self.alertView addSubview:self.sureBtn];
//        }else{
//            //单按钮
//            [self.alertView addSubview:self.cancelBtn];
//        }
//        
        
        [self initUI];
        
    }
    
    
    return self;
}

- (void)initUI{
    
    self.alertView.frame = CGRectMake(kAlertViewEdgeLeft, 170, ScreenSizeWidth-kAlertViewEdgeLeft*2, kAlertViewHeight);
    
 
    self.titleVeiw.frame = CGRectMake(0, 0, self.frame.size.width, 176*HEIGHT);
       self.cancelBtnnew.frame = CGRectMake(self.titleVeiw.frame.size.width-55,-10,52, 52);
    self.confirmBtn.frame = CGRectMake(20,self.frame.size.height - 55,180, 30);
    self.bjImageView.frame = CGRectMake(63,self.frame.size.height - 95,94, 34);
//    self.titleLabel.frame = CGRectMake(0, 15, self.alertView.frame.size.width , KTitleheight);
//    self.pdhoneTextLable.frame = CGRectMake(0, 60,self.alertView.frame.size.width , KTitleheight);
//   
////    self.quabxiaolBtn.frame = CGRectMake(self.alertView.frame.size.width -50, 0, 39, 39);
//
//     self.VerificationCodeView.frame = CGRectMake(10, CGRectGetMaxY(self.pdhoneTextLable.frame) +15, self.alertView.frame.size.width -20, kContentHeight);
//    self.contentLabel.frame = CGRectMake(0, 0, self.alertView.frame.size.width-130, kContentHeight);
////
//    
//    self.getCodeBtn.frame = CGRectMake(CGRectGetMaxX( self.contentLabel.frame)+5, 0, 105, kContentHeight);
//    
//    //添加一条横线
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX( self.contentLabel.frame)+2, 6, 1, kContentHeight -12)];
//    lineView.backgroundColor = kLineColor;
//    [self.VerificationCodeView addSubview:lineView];
//    
//    if (self.sureStr != nil) {
//        //双按钮
//        self.cancelBtn.frame = CGRectMake(0, self.alertView.frame.size.height -50, self.alertView.frame.size.width/2, 50);
//        
//        self.sureBtn.frame = CGRectMake(self.alertView.frame.size.width/2, self.alertView.frame.size.height -50, self.alertView.frame.size.width/2, 50);
//    }else{
//        //单按钮
//        self.cancelBtn.frame = CGRectMake(kBtnEdgeLeft, CGRectGetMaxY(self.contentLabel.frame)+5, self.alertView.frame.size.width, kBtnHeight);
//    }
//    
    
    
}

- (void)show{
    self.frame = CGRectMake(0, 0, ScreenSizeWidth, ScreenSizeHeight);
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    self.alertView.alpha = 0.0;
    [UIView animateWithDuration:0.4 animations:^{
        self.alertView.alpha = 1.0;
    } completion:^(BOOL finished) {
        
    }];
    
}


- (void)cancelBtnPressed{
    [UIView animateWithDuration:0.3 animations:^{
        self.alpha = 0;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

- (void)BtnPressed:(UIButton *)sender{
    
    [self cancelBtnPressed];
    NSInteger index = sender.tag-1990;
    if (index == 0) {
        
        if (self.btnClickBlock) {
            self.btnClickBlock(0,nil);
        }
    }else if (index == 1){
        
        if (self.btnClickBlock) {
            self.btnClickBlock(1,self.contentLabel.text);
        }
    }
    
    [self hiddenKeyboard];
    
}

//- (void)hiddenKeyboard{
//    if ([self.contentLabel becomeFirstResponder]) {
//        [self.contentLabel endEditing:YES];
//    }else{
//        
//    }
//}

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
- (void)tapHandle:(UIGestureRecognizer *)gesture {
    [self hiddenKeyboard];
}
- (void)hiddenKeyboard {
    if ([self.contentLabel isFirstResponder]) {
        [self.contentLabel resignFirstResponder];
    }
    
}
-(void)getCodeBtnClick:(UIButton *)sender
{
    [self.getCodeBtn setTitle:@"重新获取" forState:0];
}

@end
