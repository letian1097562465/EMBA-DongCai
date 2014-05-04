//
//  WYIOSEData.m
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import "WYIOSEData.h"

static WYIOSEData *instance;
@implementation WYIOSEData




+(WYIOSEData*)getInstance
{
    
    if (instance == nil)
    {
        instance = [[WYIOSEData alloc]init];
    }
    return instance;
    
}


-(NSData*)updateImageViewDis:(NSString *)stringURl
{
    
    
    NSError *error = nil ;
    
    
   // NSURL *url = [[NSURL alloc] initWithScheme:@"http" host:@"211.103.232.45:8085" path:[NSString stringWithFormat:@"/%@",stringURl]];
    
    NSURL *url = [[NSURL alloc]initWithString:stringURl];
    
    NSData *imagedata=[NSData dataWithContentsOfURL:url options:(NSDataReadingMappedIfSafe) error:&error];
    
    
    NSLog(@"error===%@",error);
    
    return imagedata;
}

@end
