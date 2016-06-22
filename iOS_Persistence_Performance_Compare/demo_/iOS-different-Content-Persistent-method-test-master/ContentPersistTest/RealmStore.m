//
//  RealmStore.m
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import "RealmStore.h"
#import <Realm/Realm.h>
#import "RealmDataModel.h"

@interface RealmStore()

@property (nonatomic, strong)RLMRealm *realm;

@end

@implementation RealmStore

- (instancetype)init{
    if (self = [super init]) {
        _realm = [RLMRealm defaultRealm];
    }
    return self;
}

- (void)insertWithKey:(NSString *)key attr1:(NSString *)attr1
{
    RealmDataModel *model = [[RealmDataModel alloc] init];
    model.key = key;
    model.attr1 = attr1;
    [_realm transactionWithBlock:^{
        [RealmDataModel createOrUpdateInRealm:_realm withValue:model];
    }];
}

- (id)findWithKey:(NSString *)key{
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"key = %@", key];
    return [RealmDataModel objectsWithPredicate:pred];
}

- (void)updateAll{
    RLMResults *s = [RealmDataModel allObjects];
    [_realm transactionWithBlock:^{
        int i = 0;
        for (i = 0; i < 10240; i++) {
            RealmDataModel *model = [s objectAtIndex:i];
            model.attr1 = [NSString stringWithFormat:@"%@", @(i)];
        }
    }];
}
@end
