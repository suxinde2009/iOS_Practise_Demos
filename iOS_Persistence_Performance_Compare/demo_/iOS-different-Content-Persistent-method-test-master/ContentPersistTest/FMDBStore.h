//
//  FMDBStore.h
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBStore : NSObject

- (void)insertOrUpdateWithKey:(NSString *)key attr1:(NSString *)attr1;

- (id)findWithKey:(NSString *)key;

- (void)updateAll;

@end
