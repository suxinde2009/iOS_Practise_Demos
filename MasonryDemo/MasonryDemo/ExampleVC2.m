//
//  ExampleVC2.m
//  MasonryDemo
//
//  Created by sxd on 15/7/22.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "ExampleVC2.h"
#import <Masonry.h>
#import <MMPlaceHolder.h>

@implementation ExampleVC2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView *subView = [[UIView alloc] init];
    subView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:subView];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
        
    }];
    
    
    UIView *subView1 = [[UIView alloc] init];
    [subView1 showPlaceHolder];
    subView1.backgroundColor = [UIColor grayColor];
    [subView addSubview:subView1];
    
    [subView1 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.edges.equalTo(subView).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
        
        /*
         等价于
        make.top.equalTo(subView).with.offset(10);
        make.left.equalTo(subView).with.offset(10);
        make.bottom.equalTo(subView).with.offset(-10);
        make.right.equalTo(subView).with.offset(-10);
         */
        
        /*
         也等价于
        make.top.left.bottom.and.right.equalTo(subView).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
         */
        
    }];
}

@end
