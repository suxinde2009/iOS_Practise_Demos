//
//  ViewController.m
//  UIButtonUIEdgeInsetsMaketitleDemo
//
//  Created by suxinde on 16/6/6.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+Utils.h"

@interface ViewController ()

@property (nonatomic, assign) IBOutlet UIButton *testBtn;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //[self.testBtn titleUpImage];
    [self.testBtn titleUnderImage];
    
}


- (IBAction)clickAction:(id)sender
{
    NSLog(@"%s", __func__);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
