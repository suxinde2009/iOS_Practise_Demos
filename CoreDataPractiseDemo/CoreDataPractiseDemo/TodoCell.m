//
//  TableViewCell.m
//  CoreDataPractiseDemo
//
//  Created by suxinde on 15/7/10.
//  Copyright (c) 2015年 suxinde. All rights reserved.
//

#import "TodoCell.h"

@implementation TodoCell

- (void)awakeFromNib {

    [super awakeFromNib];
    
    [self setupViews];
}

- (void)setupViews
{
    UIImage *imageNormal = [UIImage imageNamed:@"button-done-normal"];
    UIImage *imageSelected = [UIImage imageNamed:@"button-done-selected"];
    
    [self.doneButton setImage:imageNormal forState:UIControlStateNormal];
    [self.doneButton setImage:imageNormal forState:UIControlStateDisabled];
    [self.doneButton setImage:imageSelected forState:UIControlStateSelected];
    [self.doneButton setImage:imageSelected forState:UIControlStateHighlighted];
    [self.doneButton addTarget:self action:@selector(didTapButton:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didTapButton:(id)sender
{
    if (self.didTapButtonBlock) {
        self.didTapButtonBlock();
    }
}

@end
