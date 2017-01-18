//
//  MTStretchyHeaderView.m
//  MainPageDemo
//
//  Created by suxinde on 2017/1/17.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import "MTStretchyHeaderView.h"

#import <Masonry.h>

@implementation MTStretchyHeaderView

- (void)commonInit
{
    self.backgroundColor = [UIColor blueColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:17.0f];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"dafdsfads";
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor redColor];
    
    [self addSubview:label];
    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsZero);
    }];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self commonInit];
    }
    return self;
}

- (instancetype)init
{
    if (self = [super init]) {
        [self commonInit];
    }
    return self;
}

- (void)didChangeStretchFactor:(CGFloat)stretchFactor {
    // to be implemented in subclasses
    
    [super didChangeStretchFactor:stretchFactor];
    
    
    if (stretchFactor < 0.5f) {
        if ([self.shrinkDelegate respondsToSelector:@selector(stretchyHeaderViewDidTriggerShrink:)]) {
            [self.shrinkDelegate stretchyHeaderViewDidTriggerShrink:self];
        }
    }
    
    NSLog(@"%s: %@", __func__, @(stretchFactor));
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
