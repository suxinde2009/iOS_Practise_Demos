//
//  HelloLayer.h
//  GameDemo01
//
//  Created by SuXinDe on 16/5/29.
//  Copyright © 2016年 SuXinDe. All rights reserved.
//

#import <cocos2d.h>

@interface HelloLayer : CCLayer {

    CGPoint originPos;
    CGPoint clickCenter;
    
    CCSprite *sprite;
    CCSprite *icon;
    
    CCTexture2D *texture1;
    CCTexture2D *texture2;
    CCTexture2D *texture3;
    CCTexture2D *texture4;
    
    int iconStatus;
    int tickCount;
    bool isTouchMoved;
}

- (void)updateScreen;

@end
