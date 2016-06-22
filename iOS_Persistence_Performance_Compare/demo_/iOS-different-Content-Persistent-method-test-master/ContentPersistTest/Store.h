//
//  Store.h
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "CoreDataEnity.h"

@interface Store : NSObject

@property (nonatomic,strong,readonly) NSManagedObjectContext* mainManagedObjectContext;

- (CoreDataEnity *)findWithKey:(NSString *)key;

- (void)updateAttrValues:(NSArray *)value;

@end
