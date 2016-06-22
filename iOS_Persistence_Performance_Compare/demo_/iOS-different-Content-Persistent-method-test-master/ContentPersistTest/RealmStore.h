//
//  RealmStore.h
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

@interface RealmStore : NSObject

- (void)insertWithKey:(NSString *)key attr1:(NSString *)attr1;

- (id)findWithKey:(NSString *)key;

- (void)updateAll;

@end
