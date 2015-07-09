//
//  Item.h
//  CoreDataPractiseDemo
//
//  Created by suxinde on 15/7/10.
//  Copyright (c) 2015年 suxinde. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Item : NSManagedObject

@property (nonatomic, retain) NSDate * createDate;
@property (nonatomic, retain) NSNumber * done;
@property (nonatomic, retain) NSString * name;

@end
