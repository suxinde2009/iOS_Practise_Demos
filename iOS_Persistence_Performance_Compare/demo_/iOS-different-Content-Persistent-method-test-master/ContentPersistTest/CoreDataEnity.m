//
//  CoreDataEnity.m
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import "CoreDataEnity.h"

@implementation CoreDataEnity

+ (NSString *)entityName{
    return NSStringFromClass(self);
}

+ (void)findAndUpdateValuesWithContext:(NSManagedObjectContext *)context values:(NSArray *)values{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"key != ' '"];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[CoreDataEnity entityName]];
    request.predicate = predicate;
    NSArray *objects = [context executeFetchRequest:request error:nil];
    [objects enumerateObjectsUsingBlock:^(CoreDataEnity * obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.attribute1 = [NSString stringWithFormat:@"%@", @(idx)];
    }];
    [context save:nil];
}

+ (instancetype)findOrCreateNewObjectWithContext:(NSManagedObjectContext *)context key:(NSString *)key
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"key = %@", key];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[CoreDataEnity entityName]];
    request.predicate = predicate;
    request.fetchLimit = 1;
    id object = [[context executeFetchRequest:request error:nil] lastObject];
    if (object != nil) {
        return object;
    }
    object = [NSEntityDescription insertNewObjectForEntityForName:[CoreDataEnity entityName] inManagedObjectContext:context];
    return object;
}

+ (id)findObjectWithContext:(NSManagedObjectContext *)context key:(NSString *)key{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"key = %@", key];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:[CoreDataEnity entityName]];
    request.predicate = predicate;
    request.fetchLimit = 1;
    id object = [[context executeFetchRequest:request error:nil] lastObject];
    return object;
}

+ (void)importNewDataWithKey:(NSString *)key
                       attr1:(NSString *)attr1
        managedObjectContext:(NSManagedObjectContext *)context
{
    CoreDataEnity *entity = [CoreDataEnity findOrCreateNewObjectWithContext:context key:key];
    entity.key = key;
    entity.attribute1 = attr1;
}

@end
