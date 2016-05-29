//
//  HelloLayer.m
//  GameDemo01
//
//  Created by SuXinDe on 16/5/29.
//  Copyright © 2016年 SuXinDe. All rights reserved.
//

#import "HelloLayer.h"

#import <cocos2d.h>
#import <CCTexture2D.h>

@implementation HelloLayer

// on "init" you need to initialize your instance
- (id)init
{
    // always call "super" init
    // Apple recommends to re-assign "self" with the "super" return value
    if( (self=[super init] )) {
        
        [sprite addChild:icon z:1 tag:1];
        
        iconStatus = 0;
        
        // add the label as a child to this Layer
        [self addChild: sprite];
        
        isTouchMoved = FALSE;
        
        tickCount = 0;
    }
    return self;
}


- (void) ccTouchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
    
    NSLog(@"Clicked");
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView: [touch view]];
    clickCenter = [[CCDirector sharedDirector] convertToGL:location];
    
    //originPos = [[field getSprite] location];
    
    isTouchMoved = FALSE;
}

- (void) ccTouchesMoved:(NSSet*)touches withEvent:(UIEvent*)event {
    
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint nowPos = [[CCDirector sharedDirector] convertToGL:location];
    
    double locX = originPos.x + (nowPos.x - clickCenter.x);
    double locY = originPos.y + (nowPos.y - clickCenter.y);
    
    //[dispatcher setMapLocation:CGPointMake(locX, locY)];
    
    //[[field getSprite] setLocation:CGPointMake(posX, posY)];
    
    isTouchMoved = TRUE;
    
}

- (void) ccTouchesEnded:(NSSet*)touches withEvent:(UIEvent*)event {
    
    if (isTouchMoved) {
        return;
    }
    
    UITouch *touch = [touches anyObject];
    
    CGPoint location = [touch locationInView: [touch view]];
    CGPoint convertedLocation = [[CCDirector sharedDirector] convertToGL:location];
    
    //[dispatcher clickedOn:convertedLocation];
    
    /*
     
     CGPoint inMapLocation = [field getMapLocationbyScreen:convertedLocation];
     
     NSLog(@"in map location (%f, %f)", inMapLocation.x, inMapLocation.y);
     
     CGPoint pos = [field convertLocToPos:CGPointMake([field tempTarget].x, inMapLocation.y)];
     CGPoint pos2 = [field convertLocToPos:CGPointMake(inMapLocation.x, inMapLocation.y)];
     
     [field moveCreature:1 To:pos AndTo:pos2];
     
     NSLog(@"Move To (%f, %f) AndTo (%f, %f)", pos.x, pos.y, pos2.x, pos2.y);
     
     */
    
    // If the screen is out, put it back
    /*
     if (convertedLocation.x > [sprite getSize].width/2)
     {
     float deltaX = convertedLocation.x - sprite.size.width/2;
     sprite.position = ccp(sprite.position.x - deltaX, sprite.position.y);
     }
     */
}

-(void) updateScreen
{
    // [field takeTick];
    
    if (tickCount == 100) {
        //[field moveCreature:1 To:CGPointMake(15, 25) AndTo:CGPointMake(15, 20)];
    }
    
    
    // tickCount ++;
    /*
     
     // icon.position = ccp (icon.position.x + 1, icon.position.y + 1);
     
     switch (iconStatus) {
     case 0:
     [icon setTexture:texture1];
     icon.opacity = 128;
     break;
     case 1:
     [icon setTexture:texture2];
     icon.opacity = 128;
     break;
     case 2:
     [icon setTexture:texture3];
     icon.opacity = 128;
     break;
     case 3:
     [icon setTexture:texture2];
     icon.opacity = 128;
     break;
     
     default:
     break;
     }
     iconStatus = (iconStatus + 1) % 4;
     
     */
}


// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
    // in case you have something to dealloc, do it in this method
    // in this particular example nothing needs to be released.
    // cocos2d will automatically release all the children (Label)
    

}



@end
