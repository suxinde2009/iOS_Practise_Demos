//
//  RealmDataModel.m
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import "RealmDataModel.h"

@implementation RealmDataModel

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

+ (NSString *)primaryKey
{
    return @"key";
}

@end
