//
//  ListofnetworkoperatorsCell.m
//  MobileGlobalCard
//
//  Created by 李忠华 on 2017/7/16.
//  Copyright © 2017年 Quanten. All rights reserved.
//

#import "ListofnetworkoperatorsCell.h"
#/**比例适配*/
#define MAINCOLOR [UIColor whileColor]
#define SCREEN_W [UIScreen mainScreen].bounds.size.width
#define SCREEN_H  [UIScreen mainScreen].bounds.size.height
#define WIDTH [[UIScreen mainScreen]bounds].size.width/320
#define HEIGHT [[UIScreen mainScreen]bounds].size.height/568


@interface ListofnetworkoperatorsCell ()


@end
@implementation ListofnetworkoperatorsCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self)
    {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    
   self.icoimage =[[UIImageView alloc]init];
    [self addSubview: self.icoimage];
     self.icoimage.image = [UIImage imageNamed:@"Home_the_new_tiedCard"];
     self.icoimage.frame = CGRectMake(WIDTH*10,18*HEIGHT ,WIDTH*60 , HEIGHT*40);
    
  
    //国家名称
    self.name =  [[UILabel alloc]init];
    self.name.text =@"中国";
     self.yunYingShangname.font = [UIFont systemFontOfSize:17];
    self.name.frame =CGRectMake(WIDTH*75, 18*HEIGHT, 150*WIDTH, 25*HEIGHT);
    [self addSubview:  self.name];
 
   
//    运营商   CMHK
    self.yunYingShangname = [[UILabel alloc]init];
    self.yunYingShangname.font = [UIFont systemFontOfSize:13];
    [self addSubview:self.yunYingShangname ];
    self.yunYingShangname.numberOfLines = 0;
    self.yunYingShangname.textColor = [UIColor grayColor];
    NSString * yunyingshang = @"CMHK";
    self.yunYingShangname.text =[NSString stringWithFormat:@"%@:%@",NSLocalizedString(@"yunyingshang", nil),yunyingshang];
    self.yunYingShangname.frame = CGRectMake(75*WIDTH, 35*HEIGHT, 230*WIDTH, 30*HEIGHT);
     self.yunYingShangname.lineBreakMode = NSLineBreakByCharWrapping; ///设置文本自动换行
//    self.yunYingShangname.backgroundColor = [UIColor yellowColor];
    
////    APN 
//    self.cicyname = [[UILabel alloc]init];
//    self.cicyname.text = @"大中华";
//     self.cicyname.textColor = [UIColor grayColor];
//      self.cicyname.font = [UIFont systemFontOfSize:13];
//    [self addSubview:self.cicyname];
//    self.cicyname.frame = CGRectMake(75*WIDTH, 55*HEIGHT, 100*WIDTH, HEIGHT*20);
//    self.yunYingShangname.textColor = [UIColor grayColor];
    
    
    
}












@end
