//
//  main.m
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Store.h"
#import "CoreDataEnity.h"
#import "FMDBStore.h"
#import "RealmStore.h"

#define NUMBER_TO_TEST 10240

int main(int argc, const char * argv[]) {
    
    double then, now;
    
    Store *store = [[Store alloc] init];
    
    FMDBStore *fmdbStore = [[FMDBStore alloc] init];
    
    RealmStore *realmStore = [[RealmStore alloc] init];
    
    @autoreleasepool {
        long i;
     
        //Core Data
        then = CFAbsoluteTimeGetCurrent();
        
        /****************
         插入语句
         ****************/
//        for (i = 0; i < NUMBER_TO_TEST; i++) {
//            [CoreDataEnity importNewDataWithKey:[NSString stringWithFormat:@"%@", @(i)] attr1:@"attr" managedObjectContext:store.mainManagedObjectContext];
//            [store.mainManagedObjectContext save:nil];
//        }
        
        
        
        /****************
         查询语句
         ****************/
        for (i = 0; i < NUMBER_TO_TEST; i++) {
            [store findWithKey:[NSString stringWithFormat:@"%@", @(i)]];
        }

        /****************
         更新语句
         ****************/
//        [store updateAttrValues:nil];
        now = CFAbsoluteTimeGetCurrent();
        
        NSLog(@"CoreData Insert %@ Objects Time is : %@", @(NUMBER_TO_TEST),@(now - then));
        
        
        //FMDB
        
        /****************
         插入语句
         ****************/
        then = CFAbsoluteTimeGetCurrent();
//        for (i = 0; i < NUMBER_TO_TEST; i++) {
//            [fmdbStore insertOrUpdateWithKey:[NSString stringWithFormat:@"%@", @(i)] attr1:@"attr"];
//        }
//        
        /****************
         查询语句
         ****************/
        for (i = 0; i < NUMBER_TO_TEST; i++) {
            [fmdbStore findWithKey:[NSString stringWithFormat:@"%@", @(i)]];
        }
        /****************
         更新语句
         ****************/
//        [fmdbStore updateAll];
        now = CFAbsoluteTimeGetCurrent();
        NSLog(@"FMDB Insert %@ Objects Time is : %@", @(NUMBER_TO_TEST),@(now - then));

        //Realm
        
        /****************
         插入语句
         ****************/
        then = CFAbsoluteTimeGetCurrent();
//        for (i = 0; i < NUMBER_TO_TEST; i++) {
//                [realmStore insertWithKey:[NSString stringWithFormat:@"%@", @(i)] attr1:@"attr"];
//        }
        /****************
         查询语句
         ****************/
        for (i = 0; i < NUMBER_TO_TEST; i++) {
            [realmStore findWithKey:[NSString stringWithFormat:@"%@", @(i)]];
        }
        /****************
         更新语句
         ****************/
//        [realmStore updateAll];
        now = CFAbsoluteTimeGetCurrent();
        NSLog(@"Realm Insert %@ Objects Time is : %@", @(NUMBER_TO_TEST),@(now - then));

        
    }
    return 0;
}
