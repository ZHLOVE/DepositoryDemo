//
//  SecondViewController.h
//  city
//
//  Created by Cnw on 16/2/29.
//  Copyright © 2016年 Cnw. All rights reserved.
//

#import "ViewController.h"
#import "HZRegionalChoiceVC.h"
@interface SecondViewController : HZRegionalChoiceVC

/** 包含的cities数组*/
@property (nonatomic ,strong) NSArray * area_array;

/** 所选择的省份 */
@property (nonatomic, copy) NSString *province;

@end
