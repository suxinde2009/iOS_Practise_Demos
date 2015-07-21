//
//  ExampleVC1.m
//  MasonryDemo
//
//  Created by sxd on 15/7/22.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "ExampleVC1.h"

#import <Masonry/Masonry.h>
#import <MMPlaceHolder/MMPlaceHolder.h>

@implementation ExampleVC1

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *subView = [UIView new];
    subView.backgroundColor = [UIColor orangeColor];
    [subView showPlaceHolder];
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:subView];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
}

@end
