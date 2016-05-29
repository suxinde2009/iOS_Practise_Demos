//
//  HelloScene.h
//  GameDemo01
//
//  Created by SuXinDe on 16/5/29.
//  Copyright © 2016年 SuXinDe. All rights reserved.
//

#import <cocos2d.h>
#import "HElloLayer.h"

@interface HelloScene : CCScene {
    int gameTick;
    HelloLayer *mainLayer;
}

+ (id)scene;

- (void)step:(ccTime)delta;

@end
