//
//  PostCode+CoreDataProperties.h
//  PostCodeInChinaStoreByCoreData
//
//  Created by suxinde on 16/5/27.
//  Copyright © 2016年 suxinde. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PostCode.h"

NS_ASSUME_NONNULL_BEGIN

@interface PostCode (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *city;
@property (nullable, nonatomic, retain) NSString *cityId;
@property (nullable, nonatomic, retain) NSString *district;
@property (nullable, nonatomic, retain) NSString *id;
@property (nullable, nonatomic, retain) NSString *postCode;
@property (nullable, nonatomic, retain) NSString *province;

@end

NS_ASSUME_NONNULL_END
