//
//  HZOpenAccountVC.m
//  QHXPasswordTextField
//
//  Created by apple on 2017/8/28.
//  Copyright © 2017年 com.yitong.cn. All rights reserved.
//

#import "HZOpenAccountVC.h"
#import "HZNextOpenAccountVC.h"
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568
@interface HZOpenAccountVC ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,UIGestureRecognizerDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UITextField *consigneeTextField;
@property (nonatomic, strong) UITextField *contactPhoneTextField;
@property (nonatomic, strong) UITextField *addressTextField;
@property (nonatomic, strong) UITextField *zipCodeTextField;
@property(nonatomic,strong)UIButton * nextBut;
@property(nonatomic,strong)UIImageView *jiantou;
@property(nonatomic,strong)UIButton * saoMiaoIDCBut; ///扫描身份证

@property (nonatomic, strong) UILabel * openingBankLable;///开户行
@property (nonatomic, strong) UITextField *phoneTextField; ///预留手机号
@property(nonatomic,strong)UIImageView *bankOfShanghaiTitle;


@end

@implementation HZOpenAccountVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    [self.view addSubview:self.tableView];
    [self.view addSubview:self.nextBut];
    //    [self.view addSubview:self.bankOfShanghaiTitle];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                          action:@selector(tapHandle:)];
    tap.delegate = self;
    [self.tableView addGestureRecognizer:tap];
    UIView * footView =  [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 100)];
    
    [footView addSubview:self.bankOfShanghaiTitle ];
    self.tableView.tableFooterView  = footView;
    
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}
#pragma mark - getter & setter
- (UITableView *)tableView {
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame :self.view.bounds
                                                   style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 60;
    }
    return _tableView;
}
///真实姓名
- (UITextField *)consigneeTextField {
    if (_consigneeTextField == nil) {
        _consigneeTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 10, self.view.bounds.size.width - 25 - 95, 50)];
        _consigneeTextField.textColor = [UIColor colorWithRed:0.06 green:0.04 blue:0.04 alpha:1.00];
        _consigneeTextField.textAlignment = NSTextAlignmentRight;
        _consigneeTextField.placeholder =@"请输入本人姓名";
        [_consigneeTextField setFont:[UIFont fontWithName:@"Arial" size:15]];
        
        _consigneeTextField.delegate = self;
    }
    return _consigneeTextField;
}
///身份证号
- (UITextField *)contactPhoneTextField {
    if (_contactPhoneTextField == nil) {
        _contactPhoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width - 25 - 95, 50)];
        _contactPhoneTextField.textColor = [UIColor colorWithRed:0.06 green:0.04 blue:0.04 alpha:1.00];
        _contactPhoneTextField.textAlignment = NSTextAlignmentRight;
        _contactPhoneTextField.placeholder = @"请输入本人身份证号码";
        [_contactPhoneTextField setFont:[UIFont fontWithName:@"Arial" size:15]];
        
        _contactPhoneTextField.delegate = self;
    }
    return _contactPhoneTextField;
}
///银行卡号
- (UITextField *)addressTextField {
    if (_addressTextField == nil) {
        _addressTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 5, self.view.bounds.size.width - 160, 50)];
        _addressTextField.textColor = [UIColor colorWithRed:0.06 green:0.04 blue:0.04 alpha:1.00];
        _addressTextField.textAlignment = NSTextAlignmentRight;
        _addressTextField.placeholder = @"请输入您的银行卡卡号";
        [_addressTextField setFont:[UIFont fontWithName:@"Arial" size:15]];
        
        _addressTextField.delegate = self;
    }
    return _addressTextField;
}

///选择银行
- (UITextField *)zipCodeTextField {
    if (!_zipCodeTextField ) {
        _zipCodeTextField = [[UITextField alloc] initWithFrame:CGRectMake(100, 5, self.view.bounds.size.width - 160, 50)];
        _zipCodeTextField.textColor = [UIColor colorWithRed:0.06 green:0.04 blue:0.04 alpha:1.00];
        _zipCodeTextField.textAlignment = NSTextAlignmentRight;
        _zipCodeTextField.placeholder = @"请选择银行";
        [_zipCodeTextField setFont:[UIFont fontWithName:@"Arial" size:15]];
        
        _zipCodeTextField.delegate = self;
    }
    return _zipCodeTextField;
}
///开户行
-(UILabel *)openingBankLable
{
    if (!_openingBankLable) {
        _openingBankLable = [[UILabel alloc] initWithFrame:CGRectMake(100, 10, self.view.bounds.size.width - 140, 40)];
        _openingBankLable.textColor = [UIColor grayColor];
        _openingBankLable.textAlignment = NSTextAlignmentRight;
        
        _openingBankLable.font  = [UIFont systemFontOfSize:15];
        _openingBankLable.text = @"中国建设银行";
        //        _openingBankLable.backgroundColor  = [UIColor yellowColor];
    }
    return _openingBankLable;
}

///选择银行
- (UITextField *)phoneTextField {
    if (_phoneTextField == nil) {
        _phoneTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width  - 95 -25, 50)];
        _phoneTextField.textColor = [UIColor colorWithRed:0.06 green:0.04 blue:0.04 alpha:1.00];
        _phoneTextField.textAlignment = NSTextAlignmentRight;
        _phoneTextField.placeholder = @"请输入你在银行的预留手机号码";
        [_phoneTextField setFont:[UIFont fontWithName:@"Arial" size:15]];
        
        _phoneTextField.delegate = self;
    }
    return _phoneTextField;
}

-(UIImageView *)jiantou
{
    if (!_jiantou) {
        _jiantou = [[UIImageView alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 35, 18, 24, 24)];
        //        _jiantou.backgroundColor = [UIColor blueColor];
        
    }
    return _jiantou;
}




-(UIButton *)saoMiaoIDCBut
{
    if (!_saoMiaoIDCBut) {
        _saoMiaoIDCBut = [[UIButton alloc]initWithFrame:CGRectMake(self.view.bounds.size.width - 35, 18, 24, 24)];
        [_saoMiaoIDCBut addTarget:self action:@selector(saoMiaoIDCButClick) forControlEvents:UIControlEventTouchUpInside];
        [_saoMiaoIDCBut setImage:[UIImage imageNamed:@"扫描二维码1x"] forState:0];
    }
    return _saoMiaoIDCBut;
}
-(UIImageView *)bankOfShanghaiTitle
{
    if (!_bankOfShanghaiTitle) {
        _bankOfShanghaiTitle = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"LOGO.1x"]];
        _bankOfShanghaiTitle.frame = CGRectMake(40*WIDTH, 0*HEIGHT, 250*WIDTH, 41*HEIGHT);
        
    }
    return _bankOfShanghaiTitle;
}



#pragma mark - UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section ==0) {
        return 2;
    }
    else
    {
        return 4;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addressEditerCell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:@"addressEditerCell"];
    }
    
    if (indexPath.section==0) {
        switch (indexPath.row) {
            case 0: {
                
                cell.accessoryView = self.consigneeTextField;
                cell.textLabel.text = @"真实姓名";
                break;
            }
            case 1: {
                cell.accessoryView = self.contactPhoneTextField;
                cell.textLabel.text =@"身份证号";
                break;
            }
            default:
                break;
        }
        
    }else  if (indexPath.section==1) {
        switch (indexPath.row) {
            case 0: {
                //                                cell.accessoryView = self.addressTextField;
                [cell.contentView addSubview:self.addressTextField];
                [cell.contentView addSubview:self.saoMiaoIDCBut];
                cell.textLabel.text = @"银行卡号";
                break;
            }
            case 1: {
                [cell.contentView  addSubview:self.zipCodeTextField];
                cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
                cell.textLabel.text =@"开行类别";
                break;
            }
            case 2: {
                //                 cell.accessoryView = self.openingBankLable;
                [cell.contentView addSubview:self.openingBankLable];
                [cell.contentView addSubview:self.jiantou];
                self.jiantou.image = [UIImage imageNamed:@"定位1x"];
                
                cell.textLabel.text =@"开户行";
                break;
            }
                
            case 3: {
                cell.accessoryView = self.phoneTextField;
                cell.textLabel.text =@"预留手机";
                break;
            }
                
                
                
            default:
                break;
        }
        
    }
    
    return cell;
}



//头视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    if (section ==0) {
        return 40;
    }
    return 5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section ==0) {
        UIView *headerView = [[UIView alloc] init];
        //        headerView.backgroundColor = [UIColor yellowColor];
        
        UILabel *name = [[UILabel alloc]initWithFrame:CGRectMake(0, 11, self.view.frame.size.width , 20)];
        name.textColor = [UIColor grayColor];
        name.text = @"合众e贷携手上海银行资金存管账户,全方位保证你的资金安全";
        name.font = [UIFont systemFontOfSize:11];
        name.textAlignment = NSTextAlignmentCenter;
        [headerView addSubview:name];
        return headerView;
    }
    return [[UIView alloc] init];
}

//脚视图高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}






-(UIButton *)nextBut
{
    if (!_nextBut) {
        _nextBut = [[UIButton alloc]initWithFrame:CGRectMake(0, SCREEN_H -44*HEIGHT, SCREEN_W, 44*HEIGHT)];
        _nextBut.backgroundColor = [UIColor colorWithRed:15/255.0 green:114/255.0 blue:253/255.0 alpha:1];
        [_nextBut setTitle:@"下一步" forState:0];
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
    
    HZNextOpenAccountVC *vc  = [[HZNextOpenAccountVC alloc]init];
    vc.title = @"开通存管账户";
    [self.navigationController pushViewController:vc animated:YES];
    
    
}
///扫描身份证
-(void)saoMiaoIDCButClick
{
    NSLog(@"扫描身份证");
}
#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}

- (void)tapHandle:(UIGestureRecognizer *)gesture {
    [self hiddenKeyboard];
}



#pragma mark 键盘出现
-(void)keyboardWillShow:(NSNotification *)note
{
    CGRect keyBoardRect=[note.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height  - keyBoardRect.size.height);
}
#pragma mark 键盘消失
-(void)keyboardWillHide:(NSNotification *)note
{
    self.tableView.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 64);
}
- (void)hiddenKeyboard {
    if ([self.consigneeTextField isFirstResponder]) {
        [self.consigneeTextField resignFirstResponder];
    }
    else if ([self.contactPhoneTextField isFirstResponder]) {
        [self.contactPhoneTextField resignFirstResponder];
    }
    else if ([self.addressTextField isFirstResponder]) {
        [self.addressTextField resignFirstResponder];
    }
    else if ([self.zipCodeTextField isFirstResponder]) {
        [self.zipCodeTextField resignFirstResponder];
    }
    else if ([self.phoneTextField isFirstResponder])
    {
        [self.phoneTextField resignFirstResponder];
    }
    
}
@end
