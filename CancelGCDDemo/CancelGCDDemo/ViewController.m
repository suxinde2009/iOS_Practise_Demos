//
//  ViewController.m
//  CancelGCDDemo
//
//  Created by suxinde on 16/5/24.
//  Copyright © 2016年 suxinde. All rights reserved.
//

// http://stackoverflow.com/questions/10066897/objective-c-cancel-a-dispatch-queue-using-ui-event

#import "ViewController.h"

@interface ViewController () {
    BOOL*   cancelledPtr;
}

@end

@implementation ViewController

- (IBAction)start:(id)sender
{
    __block BOOL cancelled = NO;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        while (!cancelled) {
            NSLog(@"running");
            sleep(1);
        }
        NSLog(@"stopped");
    });
    
    cancelledPtr = &cancelled;
}

- (IBAction)stop:(id)sender
{
    if (cancelledPtr)
    {
        NSLog(@"stopping");
        
        *cancelledPtr = YES;
    }
}


@end
