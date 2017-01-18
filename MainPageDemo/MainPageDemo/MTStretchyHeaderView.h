//
//  MTStretchyHeaderView.h
//  MainPageDemo
//
//  Created by suxinde on 2017/1/17.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import <GSKStretchyHeaderView/GSKStretchyHeaderView.h>

@class MTStretchyHeaderView;
@protocol MTStretchyHeaderViewDelegate <NSObject>
@optional
- (void)stretchyHeaderViewDidTriggerShrink:(MTStretchyHeaderView *)headerView;

@end

@interface MTStretchyHeaderView : GSKStretchyHeaderView

@property (nonatomic, weak) id<MTStretchyHeaderViewDelegate> shrinkDelegate;

@end
