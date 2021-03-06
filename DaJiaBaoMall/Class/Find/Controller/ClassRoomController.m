//
//  ClassRoomController.m
//  DaJiaBaoMall
//
//  Created by 大家保 on 2017/3/27.
//  Copyright © 2017年 大家保. All rights reserved.
//

#import "ClassRoomController.h"
#import "ClassRoomCell.h"
#import "TitleViewCell.h"
#import "BaseWebViewController.h"

@interface ClassRoomController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *myTableView;

@property (nonatomic,strong)NSMutableArray *dataSourceArray;

@property (nonatomic,assign) NSInteger maxSize;

@end

static NSString *const tableviewCellIndentifer=@"Cell";

static NSString *const tableviewHeadCellIndentifer=@"HeadCell";

static NSString *const tableviewBottomCellIndentifer=@"ButtomCell";

@implementation ClassRoomController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.bgView.hidden=YES;
    [self.myTableView.mj_header beginRefreshing];
}

#pragma mark uitableview delegate;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0||indexPath.section==1) {
        ClassRoomCell *cell=[tableView dequeueReusableCellWithIdentifier:tableviewCellIndentifer];
        return cell;
//    }else{
//        ClassRoomCell *cell=[tableView dequeueReusableCellWithIdentifier:tableviewCellIndentifer];
//        return cell;
//    }
}


- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }else if (section==1){
        return 3;
    }else{
        return 1;
    }
    
}

// 配置分组头视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TitleViewCell *moreView = [tableView dequeueReusableCellWithIdentifier:tableviewHeadCellIndentifer];
    return moreView;
}

// 设置头高
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return  45;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    BaseWebViewController *webView=[[BaseWebViewController alloc]init];
    webView.urlStr=@"http://www.baidu.com";
    webView.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:webView animated:YES];
}


#pragma mark 增加addMJ_Head
- (void)addMJheader{
    MJHeader *mjHeader=[MJHeader headerWithRefreshingBlock:^{
        [self endFreshAndLoadMore];
    }];
    _myTableView.mj_header=mjHeader;
}

#pragma mark 增加addMJ_Footer
- (void)addMJ_Footer{
    MJFooter *mjFooter=[MJFooter footerWithRefreshingBlock:^{
        [self endFreshAndLoadMore];
    }];
    _myTableView.mj_footer=mjFooter;
}

#pragma mark 关闭mjrefreshing
- (void)endFreshAndLoadMore{
    [_myTableView.mj_header endRefreshing];
    if (self.dataSourceArray.count>=self.maxSize) {
        [_myTableView.mj_footer endRefreshingWithNoMoreData];
    }else{
        [_myTableView.mj_footer endRefreshing];
    }
}

#pragma mark 懒加载
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView=[[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _myTableView.backgroundColor=[UIColor clearColor];
        _myTableView.delegate=self;
        _myTableView.dataSource=self;
        _myTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.0001)];
        _myTableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 0.0001)];
        _myTableView.sectionHeaderHeight=0.0001;
        _myTableView.sectionFooterHeight=GetHeight(10);
        _myTableView.separatorInset=UIEdgeInsetsMake(0, 0, 0, 0);
        //_myTableView.separatorColor=colorc3c3c3;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([ClassRoomCell class]) bundle:nil] forCellReuseIdentifier:tableviewCellIndentifer];
        [self.view addSubview:_myTableView];
        
        [_myTableView registerNib:[UINib nibWithNibName:NSStringFromClass([TitleViewCell class]) bundle:nil] forCellReuseIdentifier:tableviewHeadCellIndentifer];
        [self.view addSubview:_myTableView];
        
        _myTableView.sd_layout.leftSpaceToView(self.view,0).topSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0);
        [self addMJheader];
    }
    return _myTableView;
}

- (NSMutableArray *)dataSourceArray{
    if (!_dataSourceArray) {
        _dataSourceArray=[NSMutableArray array];
    }
    return _dataSourceArray;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}



@end
