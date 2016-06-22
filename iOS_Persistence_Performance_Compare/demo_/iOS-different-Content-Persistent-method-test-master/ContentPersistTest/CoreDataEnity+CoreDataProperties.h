//
//  CoreDataEnity+CoreDataProperties.h
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "CoreDataEnity.h"

NS_ASSUME_NONNULL_BEGIN

@interface CoreDataEnity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *key;
@property (nullable, nonatomic, retain) NSString *attribute1;

@end

NS_ASSUME_NONNULL_END
