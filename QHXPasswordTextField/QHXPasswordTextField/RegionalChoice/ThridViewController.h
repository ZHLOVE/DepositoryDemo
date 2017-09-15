//
//  ThridViewController.h
//  city
//
//  Created by Cnw on 16/2/29.
//  Copyright © 2016年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "HZRegionalChoiceVC.h"
@interface ThridViewController : HZRegionalChoiceVC


/** 县，区数组 */
@property (nonatomic, strong) NSArray *county_Array;
/** 所选择的市区 */
@property (nonatomic, copy) NSString * select_area;
/** 所选择的省份 */
@property (nonatomic, copy) NSString *province;

@end
