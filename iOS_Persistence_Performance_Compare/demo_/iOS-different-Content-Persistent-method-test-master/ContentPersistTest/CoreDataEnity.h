//
//  CoreDataEnity.h
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataEnity : NSManagedObject

+ (void)importNewDataWithKey:(NSString *)key attr1:(NSString *)attr1 managedObjectContext:(NSManagedObjectContext *)context;

+ (id)findObjectWithContext:(NSManagedObjectContext *)context key:(NSString *)key;

+ (void)findAndUpdateValuesWithContext:(NSManagedObjectContext *)context values:(NSArray *)values;
@end

NS_ASSUME_NONNULL_END

#import "CoreDataEnity+CoreDataProperties.h"
