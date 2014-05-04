//
//  WYIOSEData.h
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import <Foundation/Foundation.h>

#define IOSE [WYIOSEData getInstance]

#define iPhone5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO)

#define  ISHeight [[UIScreen mainScreen] currentMode].size.height
#define  ISWidth [[UIScreen mainScreen] currentMode].size.width

#define  isiphone(X,Y) iPhone5 == NO ? (X) : (Y)


//----------接口-------//

#define WYMainApi @"http://app.mbmkt.com.cn/Api/"

//-------获取广告引导页---//
#define WYWelComeApi @"http://app.mbmkt.com.cn/Api/StartImg/GetStartImgs/?type=Android&companyId=%@"


//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//

//-----------//



@interface WYIOSEData : NSObject

+(WYIOSEData*)getInstance;

-(NSData*)updateImageViewDis:(NSString*)stringURl;

//-()AnalyticalData:()


@end
