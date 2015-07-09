//
//  CoreDataHelper.m
//  CoreDataPractiseDemo
//
//  Created by suxinde on 15/7/10.
//  Copyright (c) 2015年 suxinde. All rights reserved.
//

#import "CoreDataHelper.h"

@implementation CoreDataHelper

+ (instancetype)sharedInstance
{
    static dispatch_once_t onceToken;
    static CoreDataHelper *__instance = nil;
    dispatch_once(&onceToken, ^{
        __instance = [[CoreDataHelper alloc] init];
    });
    return __instance;
}

#pragma mark Helper Methods
- (void)saveManagedObjectContext {
    NSError *error = nil;
    
    if (![self.managedObjectContext save:&error]) {
        if (error) {
            NSLog(@"Unable to save changes.");
            NSLog(@"%@, %@", error, error.localizedDescription);
        }
    }
}


- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel) {
        return _managedObjectModel;
    }
    
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataDemo"
                                              withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *applicationDocDir = [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory
                                                                       inDomains:NSUserDomainMask] lastObject];
    NSURL *storeURL = [applicationDocDir URLByAppendingPathComponent:@"CoreDataDemo.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    BOOL addPersistentStoreSuccess = [_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType
                                                                               configuration:nil
                                                                                         URL:storeURL
                                                                                     options:nil
                                                                                       error:&error];
    if (!addPersistentStoreSuccess) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
    
}

@end
