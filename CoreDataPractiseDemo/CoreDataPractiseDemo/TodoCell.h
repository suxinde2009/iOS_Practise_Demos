//
//  TableViewCell.h
//  CoreDataPractiseDemo
//
//  Created by suxinde on 15/7/10.
//  Copyright (c) 2015年 suxinde. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ToDoCellDidTapButtonBlock)();

@interface TodoCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@property (copy, nonatomic) ToDoCellDidTapButtonBlock didTapButtonBlock;

@end
