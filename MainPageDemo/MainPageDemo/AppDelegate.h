//
//  AppDelegate.h
//  MainPageDemo
//
//  Created by suxinde on 2017/1/17.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MTMainTabbarViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, weak) IBOutlet MTMainTabbarViewController *tabController;

@end

