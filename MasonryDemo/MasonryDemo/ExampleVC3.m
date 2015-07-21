//
//  ExampleVC3.m
//  MasonryDemo
//
//  Created by sxd on 15/7/22.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "ExampleVC3.h"

#import <Masonry.h>
#import <MMPlaceHolder.h>

@implementation ExampleVC3

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIView *subView = [[UIView alloc] init];
    subView.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:subView];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
        
    }];
    
    
    UIView *subView2 = [[UIView alloc] init];
    [subView2 showPlaceHolder];
    subView2.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:subView2];

    UIView *subView3 = [[UIView alloc] init];
    [subView3 showPlaceHolder];
    subView3.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:subView3];
    
    NSInteger padding1 = 10;

    [subView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(subView.mas_centerY);
        make.left.equalTo(subView.mas_left).with.offset(padding1);
        make.right.equalTo(subView3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(subView3);
    }];

    [subView3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(subView.mas_centerY);
        make.left.equalTo(subView2.mas_right).with.offset(padding1);
        make.right.equalTo(subView.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@150);
        make.width.equalTo(subView2);
        
    }];
    
}

@end
