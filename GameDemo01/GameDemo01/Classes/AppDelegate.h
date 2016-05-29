//
//  AppDelegate.h
//  GameDemo01
//
//  Created by SuXinDe on 16/5/29.
//  Copyright © 2016年 SuXinDe. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class RootViewController;

@interface AppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow			*window;
    RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;


@end
