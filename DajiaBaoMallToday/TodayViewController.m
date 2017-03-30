//
//  TodayViewController.m
//  DajiaBaoMallToday
//
//  Created by 大家保 on 2017/3/29.
//  Copyright © 2017年 大家保. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#define TDSCREENWIDTH  [[UIScreen mainScreen] bounds].size.width
#define TDSCREENHEIGHT  [[UIScreen mainScreen] bounds].size.height

@interface TodayViewController () <NCWidgetProviding>{
    UIButton *frend;
    UIButton *myMoney;
    UIButton *invite;
}

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    frend=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, TDSCREENWIDTH/3.0, 100)];
    [frend setImage:[UIImage imageNamed:@"新车分期"] forState:0];
    frend.tag=100;
    [frend setTitle:@"" forState:0];
    [frend setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [frend setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [frend addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [frend setTitleColor:[UIColor redColor] forState:0];
    [self.view addSubview:frend];
    
    myMoney=[[UIButton alloc]initWithFrame:CGRectMake(TDSCREENWIDTH/3.0, 0, TDSCREENWIDTH/3.0, 100)];
    [myMoney setImage:[UIImage imageNamed:@"信用认证"] forState:0];
    [myMoney setTitle:@"" forState:0];
    myMoney.tag=101;
    [myMoney setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [myMoney setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [myMoney addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [myMoney setTitleColor:[UIColor redColor] forState:0];
    [self.view addSubview:myMoney];
    
    invite=[[UIButton alloc]initWithFrame:CGRectMake(TDSCREENWIDTH*2/3.0, 0, TDSCREENWIDTH/3.0, 100)];
    invite.tag=102;
    [invite addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    [invite setImage:[UIImage imageNamed:@"车辆抵押"] forState:0];
    [invite setTitle:@"" forState:0];
    [invite setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [invite setContentHorizontalAlignment:UIControlContentHorizontalAlignmentCenter];
    [invite setTitleColor:[UIColor redColor] forState:0];
    [self.view addSubview:invite];
    
}

//app 跳转
- (void)click:(UIButton *)sender{
    NSString *urlStr = [NSString stringWithFormat:@"DajiaBaoMallToday://%li",sender.tag];
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.extensionContext openURL:url completionHandler:^(BOOL success) {
    }];
}


- (void)viewWillAppear:(BOOL)animated{
    //设置widget展示视图的大小
    self.preferredContentSize=CGSizeMake(TDSCREENWIDTH, 110);
    if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
        self.extensionContext.widgetLargestAvailableDisplayMode = NCWidgetDisplayModeCompact;
    }
}

-(void)widgetActiveDisplayModeDidChange:(NCWidgetDisplayMode)activeDisplayMode withMaximumSize:(CGSize)maxSize{
    frend.frame=CGRectMake(0, 0, maxSize.width/3.0, 100);
    myMoney.frame=CGRectMake(maxSize.width/3.0, 0, maxSize.width/3.0, 100);
    invite.frame=CGRectMake(maxSize.width*2/3.0, 0, maxSize.width/3.0, 100);
    self.preferredContentSize=CGSizeMake(maxSize.width, 110);
}

-(UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    completionHandler(NCUpdateResultNewData);
}

@end
