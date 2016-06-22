//
//  RealmDataModel.h
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import <Realm/Realm.h>

@interface RealmDataModel : RLMObject

@property NSString *key;
@property NSString *attr1;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<RealmDataModel>
RLM_ARRAY_TYPE(RealmDataModel)
