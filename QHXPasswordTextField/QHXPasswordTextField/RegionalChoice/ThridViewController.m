//
//  ThridViewController.m
//  city
//
//  Created by Cnw on 16/2/29.
//  Copyright © 2016年 Cnw. All rights reserved.
//

#import "ThridViewController.h"

@interface ThridViewController ()

@end

@implementation ThridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title =@"地区选择" ;
      self.dingweiName.text =[NSString stringWithFormat:@"%@ . %@",self.province,self.select_area];
    self.data_array = self.county_Array;
    
    NSLog(@"%@", self.dingweiName.text );
    
  
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

  
    
      self.dingweiName.text =[NSString stringWithFormat:@"%@ . %@ . %@",self.province,self.select_area,self.data_array[indexPath.row]];
}
@end
