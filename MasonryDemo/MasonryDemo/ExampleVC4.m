//
//  ExampleVC4.m
//  MasonryDemo
//
//  Created by sxd on 15/7/22.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "ExampleVC4.h"
#import <Masonry.h>
#import <MMPlaceHolder.h>
#import "UIView+SXD.h"

@implementation ExampleVC4

- (void)viewDidLoad {
    [super viewDidLoad];

    UIView *sv = [[UIView alloc] init];
    [sv showPlaceHolder];
    
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
        
    }];
    
    
    UIView *sv11 = [UIView new];
    UIView *sv12 = [UIView new];
    UIView *sv13 = [UIView new];
    UIView *sv21 = [UIView new];
    UIView *sv31 = [UIView new];
    
    sv11.backgroundColor = [UIColor redColor];
    sv12.backgroundColor = [UIColor redColor];
    sv13.backgroundColor = [UIColor redColor];
    sv21.backgroundColor = [UIColor redColor];
    sv31.backgroundColor = [UIColor redColor];
    
    [sv addSubview:sv11];
    [sv addSubview:sv12];
    [sv addSubview:sv13];
    [sv addSubview:sv21];
    [sv addSubview:sv31];
    
    // 给予不同的大小， 测试效果
    [sv11 mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.centerY.equalTo(@[sv12, sv13]);
        make.centerX.equalTo(@[sv21, sv31]);
        make.size.mas_equalTo(CGSizeMake(40, 40));
        
    }];
    
    [sv12 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(70, 20));
    }];
    
    [sv13 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    [sv21 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(50, 20));
    }];
    
    [sv31 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(40, 60));
    }];
    
    [sv distributeSpacingHorizontallyWith:@[sv11, sv12, sv13]];
    [sv distributeSpacingVerticallyWith:@[sv11, sv21, sv31]];
    
    [sv showPlaceHolderWithAllSubviews];
    [sv hidePlaceHolder];
}

@end
