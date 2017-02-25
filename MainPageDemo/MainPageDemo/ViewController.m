//
//  ViewController.m
//  MainPageDemo
//
//  Created by suxinde on 2017/1/17.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import "ViewController.h"
#import "MTStretchyHeaderView.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate, MTStretchyHeaderViewDelegate>

@property (nonatomic, strong) MTStretchyHeaderView *stretchyView;


@property (nonatomic, weak) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.stretchyView = [[MTStretchyHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 240.0f)];
    self.stretchyView.shrinkDelegate = self;
    
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self.tableView addSubview:self.stretchyView];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - 

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"111"];
    tableViewCell.backgroundView.backgroundColor = [UIColor orangeColor];
    return tableViewCell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 400.0f;
}

#pragma mark -
- (void)stretchyHeaderViewDidTriggerShrink:(MTStretchyHeaderView *)headerView
{
    [UIView animateWithDuration:0.5 animations:^{
        headerView.alpha = 0;
        [headerView removeFromSuperview];
        self.tableView.contentInset = UIEdgeInsetsZero;    
    }];
}


- (IBAction)clickAction:(id)sender
{
    [UIView animateWithDuration:0.5 animations:^{
        self.stretchyView.alpha = 1.0f;
        [self.tableView addSubview:self.stretchyView];
    }];
    
}



@end
