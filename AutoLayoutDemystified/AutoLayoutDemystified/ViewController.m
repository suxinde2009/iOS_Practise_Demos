//
//  ViewController.m
//  AutoLayoutDemystified
//
//  Created by zj－db0367 on 15/7/19.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];

    [self initViews];
    
}


- (void)initViews
{
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    contentView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:contentView];

    
    NSLayoutConstraint *constraint;
    
    
    constraint = [NSLayoutConstraint constraintWithItem:contentView
                                              attribute:NSLayoutAttributeCenterX
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterX
                                             multiplier:1
                                               constant:0];
    
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint constraintWithItem:contentView
                                              attribute:NSLayoutAttributeCenterY
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeCenterY
                                             multiplier:1
                                               constant:0];
    [self.view addConstraint:constraint];
    
    
    
    constraint = [NSLayoutConstraint constraintWithItem:contentView
                                              attribute:NSLayoutAttributeHeight
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeHeight
                                             multiplier:1
                                               constant:0.0f];
    [self.view addConstraint:constraint];

    constraint = [NSLayoutConstraint constraintWithItem:contentView
                                              attribute:NSLayoutAttributeWidth
                                              relatedBy:NSLayoutRelationEqual
                                                 toItem:self.view
                                              attribute:NSLayoutAttributeWidth
                                             multiplier:1
                                               constant:0.0f];
    [self.view addConstraint:constraint];

    
    [self.view layoutIfNeeded];
}


@end
