//
//  MyAlertView.m
//  自定义AlertView
//
//  Created by macbook on 16/9/12.
//  Copyright © 2016年 郑卓青. All rights reserved.
//

#import "MyAlertView.h"
#import "UIView+Frame.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

#define APPCOLOR [UIColor colorWithRed:255.0/255.0 green:95.0/255.0 blue:0.0/255.0 alpha:1.0]
@interface MyAlertView ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic,strong) UIView *alertBgView;
@end


@implementation MyAlertView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 10;
        self.backgroundColor = [UIColor clearColor];
        self.clipsToBounds = YES;
        self.alertBgView=[[UIView alloc]initWithFrame:CGRectMake(0,0, self.width, self.height)];
        [self addSubview:self.alertBgView];
        self.alertBgView.backgroundColor = [UIColor clearColor];
        
        UIImageView *titleVeiw=[[UIImageView alloc]initWithFrame:CGRectMake(0, 14, 225, 176)];
        titleVeiw.userInteractionEnabled=YES;
        titleVeiw.image=[UIImage imageNamed:@"弹窗.1x"];
        [self.alertBgView addSubview:titleVeiw];
    
        ///取消按钮
        UIButton *cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        cancelBtn.frame = CGRectMake(self.alertBgView.width-55,-10,52, 52);
        [cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        [cancelBtn setImage:[UIImage imageNamed:@"弹窗叉1x"]forState:UIControlStateNormal];
        [ self.alertBgView addSubview:cancelBtn];
        
        
        
        UIView *bjView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(titleVeiw.frame) , 225, 102)];
        [self addSubview:bjView];
        bjView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"bj1x"]];
//        bjView.backgroundColor = [UIColor yellowColor];
        
        UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        confirmBtn.frame = CGRectMake(20,self.frame.size.height - 55,180, 30);
        [confirmBtn setBackgroundColor:APPCOLOR];
        confirmBtn.layer.cornerRadius = 5;
        [confirmBtn addTarget:self action:@selector(saveClickButton:) forControlEvents:UIControlEventTouchUpInside];
        [confirmBtn setTitle:@"立即开通" forState:UIControlStateNormal];
        [self addSubview:confirmBtn];
        
        UIImageView *bjImageView = [[UIImageView alloc]initWithFrame:CGRectMake(63,self.frame.size.height - 95,94, 34)];
        bjImageView.image  = [UIImage imageNamed:@"上海银行logo"];
        [self addSubview:bjImageView];
        

        [[NSNotificationCenter  defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification  object:nil];
    }
    return self;
}

-(void)cancelClick:(UIButton*)canlBtn{

    [self close];
}

-(void)saveClickButton:(UIButton*)saveBtn{
    
    if ([self.delegate respondsToSelector:@selector(saveClickButton:)]) {
        [self.delegate saveClickButton:saveBtn];
    }

    
    
}
- (void)show
{
    if (self.bgView) return;
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREENWIDTH, SCREENHEIGHT)];

//    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
//    [self.bgView addGestureRecognizer:tap];
    
    self.bgView.userInteractionEnabled = YES;
    self.bgView.backgroundColor = [UIColor blackColor];
    self.bgView.alpha = 0.2;
    [window addSubview:self.bgView];
    [window addSubview:self];
    
}

- (void)close
{
    [self.bgView removeFromSuperview];
     self.bgView = nil;
    [self removeFromSuperview];

}

//- (void)tap:(UITapGestureRecognizer *)tap
//{
//    [self close];
//}

- (void)keyboardWillChange:(NSNotification  *)notification
{
    
    // 1.获取键盘的Y值
    NSDictionary *dict  = notification.userInfo;
    CGRect keyboardFrame = [dict[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    // 获取动画执行时间
    CGFloat duration = [dict[UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    // 2.计算需要移动的距离
    CGFloat selfY = keyboardY - self.height - 50;
    
    [UIView animateWithDuration:duration delay:0.0 options:7 << 16 animations:^{
        // 需要执行动画的代码
        self.y = selfY;
        self.bgView.alpha = 0.5;
    } completion:^(BOOL finished) {
        // 动画执行完毕执行的代码
        if (_bgView == nil) {
            //  [self.textField resignFirstResponder];
            [self removeFromSuperview];
        }
    }];
}

@end
