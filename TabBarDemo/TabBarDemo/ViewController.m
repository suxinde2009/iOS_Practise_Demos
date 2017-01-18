//
//  ViewController.m
//  TabBarDemo
//
//  Created by suxinde on 2017/1/18.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import "ViewController.h"
#import "ViewController3.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    btn.backgroundColor = [UIColor greenColor];
    [btn addTarget:self action:@selector(pushClickAciton:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
}

- (void)pushClickAciton:(id)sender
{
    [self.navigationController pushViewController:[ViewController3 new] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
