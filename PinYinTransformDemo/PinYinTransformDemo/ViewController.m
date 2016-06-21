//
//  ViewController.m
//  PinYinTransformDemo
//
//  Created by sxd on 15/8/18.
//  Copyright (c) 2015年 sxd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSLog(@"%@", [self getInitial:@"呵呵呵"]);
    
     NSLog(@"%@", [self getInitial:@"中文"]);
    
}

- (NSString *)getInitial:(NSString *)str
{
    //#error `呵呵呵` 有问题
    // 这部分有问题
    NSMutableString *t  = [str mutableCopy];
    CFStringTransform((__bridge CFMutableStringRef)t, NULL, kCFStringTransformToLatin, NO);
    CFStringTransform((__bridge CFMutableStringRef)t, NULL, kCFStringTransformStripDiacritics, NO);
    
    NSString *initial = [[t uppercaseString] substringToIndex:1];
    return initial;

}

@end
