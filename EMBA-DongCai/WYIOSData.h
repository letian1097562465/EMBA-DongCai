//
//  WYIOSData.h
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOS [WYIOSData getIntance]

@interface WYIOSData : NSObject
+(WYIOSData*)getIntance;


@property(nonatomic,strong)NSString *tempPath;


@end
