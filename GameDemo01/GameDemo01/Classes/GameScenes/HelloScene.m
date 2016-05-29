//
//  HelloScene.m
//  GameDemo01
//
//  Created by SuXinDe on 16/5/29.
//  Copyright © 2016年 SuXinDe. All rights reserved.
//

#import "HelloScene.h"

@implementation HelloScene

+ (id)scene
{
    // 'scene' is an autorelease object.
    CCScene *scene = [HelloScene node];
    
    
    // return the scene
    return scene;
}

- (id)init
{
    if (self = [super init]) {
        // 'layer' is an autorelease object.
        mainLayer = [HelloLayer node];
        
        mainLayer.isTouchEnabled = TRUE;
        
        // add layer as a child to scene
        [self addChild: mainLayer];
        [self schedule: @selector(step:)];
        
        gameTick = 0;
    }
    
    return self;
}


- (void)step:(ccTime)delta
{
    gameTick++;
    
    // NSLog(@"Scene tick");
    [mainLayer updateScreen];
}

@end
