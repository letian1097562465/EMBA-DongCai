//
//  WYIOSData.m
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import "WYIOSData.h"

static WYIOSData *intance;

@implementation WYIOSData
+(WYIOSData*)getIntance
{
    if (intance == nil)
    {
        intance = [[WYIOSData alloc]init];
    }
    
    return intance;
    
}




@end
