//
//  WYWelcomeViewController.h
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WYWelcomeViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    NSArray *welArray;
    UIImageView *welIamge;
}



@property(nonatomic,strong)UIScrollView *welcomeScrollView;

@property (nonatomic,strong)UITableView *welcomeTableView;



@end
