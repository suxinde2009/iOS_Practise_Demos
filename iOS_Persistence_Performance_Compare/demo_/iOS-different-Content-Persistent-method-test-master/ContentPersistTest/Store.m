//
//  Store.m
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import "Store.h"


@interface Store()

@property (nonatomic, strong, readwrite)NSManagedObjectContext *mainManagedObjectContext;
@property (nonatomic,strong) NSManagedObjectModel* managedObjectModel;
@property (nonatomic,strong) NSPersistentStoreCoordinator* persistentStoreCoordinator;

@end

@implementation Store

- (instancetype)init{
    if (self = [super init]) {
        [self mainManagedObjectContext];
    }
    return self;
}

- (NSManagedObjectContext *)mainManagedObjectContext{
    if (_mainManagedObjectContext != nil) {
        return _mainManagedObjectContext;
    }
    _mainManagedObjectContext = [[NSManagedObjectContext alloc] init];
    _mainManagedObjectContext.persistentStoreCoordinator = [self persistentStoreCoordinator];
    return _mainManagedObjectContext;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *modelURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"CoreDataModel.sqlite"];
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:modelURL options:nil error:&error]) {
        NSLog(@"%@ - %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}

- (NSURL *)applicationDocumentsDirectory{
    return [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil];
}

- (NSManagedObjectModel *)managedObjectModel{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"CoreDataModel" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (CoreDataEnity *)findWithKey:(NSString *)key{
    return [CoreDataEnity findObjectWithContext:_mainManagedObjectContext key:key];
}

- (void)updateAttrValues:(NSArray *)value{
    [CoreDataEnity findAndUpdateValuesWithContext:_mainManagedObjectContext values:value];
}

@end
