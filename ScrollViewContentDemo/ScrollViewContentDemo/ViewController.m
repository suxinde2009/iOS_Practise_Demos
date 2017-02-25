//
//  ViewController.m
//  ScrollViewContentDemo
//
//  Created by suxinde on 2017/1/19.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import "ViewController.h"
#import <Masonry.h>

#import "ContentView.h"
#import "MTStretchyHeaderView.h"

@interface ViewController () <MTStretchyHeaderViewDelegate>

@property (nonatomic, weak) IBOutlet UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    ContentView *contentView = [[[NSBundle mainBundle] loadNibNamed:@"ContentView" owner:nil options:nil] firstObject];
    
    
    [self.scrollView addSubview:contentView];
    
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
    [self setStretchyHeaderView];

    
    self.view.clipsToBounds = NO;
}

- (void)setStretchyHeaderView
{
    MTStretchyHeaderView *s = [[MTStretchyHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 300)];
    s.shrinkDelegate = self;
    [self.scrollView addSubview:s];
    
}

- (void)stretchyHeaderViewDidTriggerShrink:(MTStretchyHeaderView *)headerView
{
    [headerView removeFromSuperview];
    self.scrollView.contentInset = UIEdgeInsetsZero;
    
}

@end
