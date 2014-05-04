//
//  modelMethods.h
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import <Foundation/Foundation.h>


#define Model [modelMethods getIntance]

@interface modelMethods : NSObject

+(modelMethods*)getIntance;



-(NSData*)downloadWecomeImageData:(NSString*)stringURl;







@end
