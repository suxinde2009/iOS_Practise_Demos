//
//  CoreDataHelper.h
//  CoreDataPractiseDemo
//
//  Created by suxinde on 15/7/10.
//  Copyright (c) 2015年 suxinde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataHelper : NSObject

@property (nonatomic, strong) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

+ (instancetype)sharedInstance;
- (void)saveManagedObjectContext;

@end
