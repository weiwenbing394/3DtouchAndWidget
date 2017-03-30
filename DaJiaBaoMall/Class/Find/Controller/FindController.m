//
//  FindController.m
//  DaJiaBaoMall
//
//  Created by 大家保 on 2017/3/27.
//  Copyright © 2017年 大家保. All rights reserved.
//

#import "FindController.h"
#import "GetCustomController.h"
#import "ClassRoomController.h"

@interface FindController ()

@end

@implementation FindController

// 创建一个单例
+ (instancetype)defaultFindController{
    static FindController *findVC = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        findVC = [[FindController alloc] initWithViewControllerClasses:[self ViewControllerClasses] andTheirTitles:@[@"获客神器",@"产品课堂"]];
        findVC.menuViewStyle=WMMenuViewStyleLine;
        findVC.menuBGColor=[UIColor clearColor];
        findVC.menuHeight=GetHeight(44);
        findVC.progressHeight=GetHeight(4);
        findVC.titleSizeNormal=GetWidth(16);
        findVC.titleSizeSelected=GetWidth(18);
        findVC.progressViewCornerRadius=GetHeight(2);
        findVC.progressViewIsNaughty=YES;
        findVC.titleColorSelected=color0196FF;
        findVC.itemsWidths=@[@(SCREEN_WIDTH/2.0),@(SCREEN_WIDTH/2.0)];
        //self.automaticallyCalculatesItemWidths=YES;
        //findVC.progressViewWidths=@[@(GetWidth(60)),@(GetWidth(60))];
        findVC.viewFrame=CGRectMake(0,20, SCREEN_WIDTH, SCREEN_HEIGHT-20-49);
    });
    return findVC;

};

// 存响应的控制器
+ (NSArray *)ViewControllerClasses {
    return @[[GetCustomController class],[ClassRoomController class]];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self addTitle:@""];
}

//添加标题
- (void)addTitle:(NSString *)title{
    UILabel * titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(60, 20, SCREEN_WIDTH-120, 43.5)];
    titleLabel.textColor=color3c3a40;
    titleLabel.font=SystemFont(18);
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.textAlignment=NSTextAlignmentCenter;
    titleLabel.text=title;
    [self.view addSubview:titleLabel];
    
    UIView *Bottonline=[[UIView alloc]initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 0.5)];
    Bottonline.backgroundColor=colorc3c3c3;
    [self.view addSubview:Bottonline];
};


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
