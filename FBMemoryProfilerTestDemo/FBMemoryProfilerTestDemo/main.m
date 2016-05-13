//
//  main.m
//  FBMemoryProfilerTestDemo
//
//  Created by suxinde on 16/5/13.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#if DEBUG
#import <FBAllocationTracker/FBAllocationTrackerManager.h>
#import <FBRetainCycleDetector/FBRetainCycleDetector.h>
#endif

int main(int argc, char * argv[]) {
    @autoreleasepool {
        
#if DEBUG
        [FBAssociationManager hook];
        [[FBAllocationTrackerManager sharedManager] startTrackingAllocations];
        [[FBAllocationTrackerManager sharedManager] enableGenerations];
#endif
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
