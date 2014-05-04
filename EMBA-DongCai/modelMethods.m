//
//  modelMethods.m
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import "modelMethods.h"

static modelMethods *intance;

@implementation modelMethods

+(modelMethods*)getIntance
{
    if (intance==nil)
    {
        intance = [[modelMethods alloc]init];
    }
    
    return intance;
}


-(NSData*)downloadWecomeImageData:(NSString *)stringURl
{
    NSError *error = nil ;
    NSURL *url = [[NSURL alloc]initWithString:stringURl];
    
    NSData *imagedata=[NSData dataWithContentsOfURL:url options:(NSDataReadingMappedIfSafe) error:&error];
    
    
    NSLog(@"error===%@",error);
    
    return imagedata;
    
}

@end
