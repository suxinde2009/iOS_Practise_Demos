//
//  XDDeviceUUID.m
//  SSKeychainDemo
//
//  Created by suxinde on 16/4/26.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import "XDDeviceUUID.h"

#import <SSKeychain/SSKeychain.h>

static NSString *const XDDeviceUUIDKey = @"XDDeviceUUIDKey";

@implementation XDDeviceUUID

// 获取App存于Keychain中的UUID
+ (NSString *)UUID
{
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appName=[infoDictionary objectForKey:(NSString*)kCFBundleNameKey];
    
    NSString *stringApplicationUUID = [SSKeychain passwordForService:appName account:XDDeviceUUIDKey];
    if (!stringApplicationUUID) {
        stringApplicationUUID  = [NSUUID UUID].UUIDString;
        [SSKeychain setPassword:stringApplicationUUID forService:appName account:XDDeviceUUIDKey];
    }
    return stringApplicationUUID;
}

// 更新App存于Keychain中的UUID
+ (void)setUUID:(NSString *)uuid
{
    BOOL isUuidNil = ((uuid == nil) || [uuid isEqualToString:@""] || (uuid.length == 0));
    NSAssert(isUuidNil == NO, @"UUID不能为空");
    
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    NSString *appName=[infoDictionary objectForKey:(NSString*)kCFBundleNameKey];
    [SSKeychain setPassword:uuid forService:appName account:XDDeviceUUIDKey];
    
    
}



@end
