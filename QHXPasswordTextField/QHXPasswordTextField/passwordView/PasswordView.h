//
//  PasswordView.h
//  AllDemos
//
//  Created by qhx on 2017/7/21.
//  Copyright © 2017年 quhengxing. All rights reserved.
//

#import <UIKit/UIKit.h>

#define ScreenSizeWidth ([UIScreen mainScreen].bounds.size.width)
#define ScreenSizeHeight ([UIScreen mainScreen].bounds.size.height)
/**比例适配*/
#define MAINCOLOR [UIColor whileColor]
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568

#define kAlertViewRadius    8     //alert圆角
#define kAlertViewHeight    277*HEIGHT  //弹框高度
#define kAlertViewEdgeLeft   60 *WIDTH   //弹框左边距

//横线
#define kLineViewHeight  44    //横线高度
#define kLineColor  [UIColor lightGrayColor]   //横线颜色

//标题
#define kTitleFontSize      20    //标题字体
#define kTitleColor  [UIColor blackColor]   //标题颜色
#define KTitleheight  44    //标题高度

//输入框
#define kContentFontSize    15      //输入框字体
#define kContentColor  [UIColor darkGrayColor]  //字体颜色
#define kBorderwidth  0.5   //圆角宽度
#define kborderColor  [UIColor lightGrayColor]      //圆角颜色
#define kContentRadius  4       //圆角弧度
#define kContentHeight  44      //输入框高度
#define kContentEdgeLeft   15   //输入框左边距

//取消按钮
#define kCancelTitleColor  [UIColor blackColor]   //取消按钮颜色
#define kCancelTitleSize    15          //字体
#define kCancelBackgroundColor   [UIColor clearColor]       //按钮背景色
#define kCancelRadius  0       //按钮弧度
#define kCancelBorderColor  [UIColor grayColor]    //边框颜色
#define kCancelBorderWidth  0.5         //边框宽度
#define kBtnHeight  44      //按钮高度
#define kBtnEdgeLeft  15    //左边距

//确定按钮
#define kSureTitleColor  [UIColor blackColor]
#define kSureTitleSize    17
#define kSureBackgroundColor   [UIColor clearColor]
#define kSureRadius  0
#define kSureBorderColor  [UIColor lightGrayColor]
#define kSurelBorderWidth  0.5



///Get validation code

typedef void (^btnClickBlock)(NSInteger index,NSString *str);

@interface PasswordView : UIView
@property (nonatomic, strong) UIView *alertView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UITextField *contentLabel;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) NSString *cancelStr;
@property (nonatomic, strong) UIButton *sureBtn;
@property (nonatomic, strong) NSString *sureStr;
@property (nonatomic, strong) UIButton *getCodeBtn;///获取验证码
@property(nonatomic,strong)UILabel *pdhoneTextLable; ///手机号码
@property (nonatomic, copy) btnClickBlock btnClickBlock;

- (id)initWithTitle:(NSString *)titleStr  cancelBtn:(NSString *)cancelBtn sureBtn:(NSString *)sureBtn btnClickBlock:(btnClickBlock)btnClickIndex;
- (void)show;
@end
