//
//  MyServiceImpl.m
//  AppLordDemo
//
//  Created by suxinde on 16/5/3.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import "MyServiceImpl.h"

@implementation MyServiceImpl

AL_EXPORT_SERVICE(MyService);

- (void)doSometing
{
    NSLog(@"MyService Task Operating...");
}

+ (BOOL)globalVisible
{
    // if return YES, service will be always in the memory
    return YES;
}

@end
