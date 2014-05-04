//
//  WYWelcomeViewController.m
//  EMBA-DongCai
//
//  Created by wanyue on 14-3-13.
//  Copyright (c) 2014年 wanyue. All rights reserved.
//

#import "WYWelcomeViewController.h"
#import "WYIOSData.h"
#import "WYIOSEData.h"
#import "modelMethods.h"
#import "welcomeCell.h"
#import "SBJson.h"
@interface WYWelcomeViewController ()

@end

@implementation WYWelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
    
    
    NSString *tempPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:@"Temp"];
    
    
    NSFileManager *fm = [NSFileManager defaultManager];
    
    [fm createDirectoryAtPath:tempPath withIntermediateDirectories:YES attributes:nil error:nil];
    
    IOS.tempPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"]stringByAppendingPathComponent:@"Temp"];
    
    
    //self.welcomeScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, 320, isiphone(480, 568))];
    
   // [self.view addSubview:self.welcomeScrollView];
    
    
    

    [self.welcomeTableView.layer setAnchorPoint:CGPointMake(0.0, 0.0)];
    
    self.welcomeTableView.transform = CGAffineTransformMakeRotation(M_PI/-2);
    
    self.welcomeTableView.pagingEnabled = YES;
    
    self.welcomeTableView.showsHorizontalScrollIndicator = NO;
    
    self.welcomeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 180,320,isiphone(480, 568))];
    
    self.welcomeTableView.rowHeight = 320.0;
    
    [self.view addSubview:self.welcomeTableView];
    

    
    NSData *data = [Model downloadWecomeImageData:WYWelComeApi];
    
    welArray = [data JSONValue];
    
    NSLog(@"hhjj");
 
    self.welcomeTableView.delegate = self;
    self.welcomeTableView.dataSource = self;
    
    [self.welcomeTableView reloadData];
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return welArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *Identifier = @"identifier";
    
    welcomeCell *cell = [tableView dequeueReusableCellWithIdentifier:Identifier];
    
    if (cell==nil)
    {
        NSArray *objects = [[NSBundle mainBundle]loadNibNamed:@"welcomeCell" owner:self options:nil];
        for (id object in objects)
        {
            if ([object isMemberOfClass:[welcomeCell class]])
            {
                cell = object;
            }
        }
    }
    
    
    cell.transform = CGAffineTransformMakeRotation(M_PI/2);
    
    NSDictionary *dic = [welArray objectAtIndex:indexPath.row];
    
    
    
   NSString *imagefilpath =[IOS.tempPath stringByAppendingFormat:@"/%@-%ld.png",[dic objectForKey:@"title"],(long)indexPath.row];
    
    NSFileManager *fm=[NSFileManager defaultManager];
    
    if([fm fileExistsAtPath:imagefilpath])
    {
        cell.welImageView.image=[UIImage imageWithContentsOfFile:imagefilpath];
    }
    else
    {
        
        [self performSelectorInBackground:@selector(disWelcomeImage:) withObject:indexPath];
        
    }

    
    return cell;
}


-(void)tableView:(UITableView *)tableView didEndDisplayingCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}







-(void)disWelcomeImage:(NSIndexPath*)indexPath
{
    @autoreleasepool
    {
        

       NSDictionary *dic = [welArray objectAtIndex:indexPath.row];
        
        NSData *imagedata = [Model downloadWecomeImageData:[dic objectForKey:@"iconUrl"]];
        
        
        NSString *imagefilepath=[IOS.tempPath stringByAppendingFormat:@"/%@-%ld.png",[dic objectForKey:@"title"],(long)indexPath.row];
        
        
        NSLog(@"imagefilepath==%@",imagefilepath);
        
        
        [imagedata writeToFile:imagefilepath atomically:YES];
        
        
        UIImage *image=[UIImage imageWithContentsOfFile:imagefilepath];
        
        
        
        welcomeCell *cell = (welcomeCell*)[self.welcomeTableView cellForRowAtIndexPath:indexPath];
        

        [cell.welImageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:YES];
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
