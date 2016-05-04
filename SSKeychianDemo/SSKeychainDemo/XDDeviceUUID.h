//
//  XDDeviceUUID.h
//  SSKeychainDemo
//
//  Created by suxinde on 16/4/26.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XDDeviceUUID : NSObject

// 获取App存于Keychain中的UUID
+ (NSString *)UUID;

// 更新App存于Keychain中的UUID
+ (void)setUUID:(NSString *)uuid;

@end
