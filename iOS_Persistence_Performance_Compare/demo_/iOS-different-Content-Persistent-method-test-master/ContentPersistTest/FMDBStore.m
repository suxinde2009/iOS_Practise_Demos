//
//  FMDBStore.m
//  ContentPersistTest
//
//  Created by mac on 9/26/15.
//  Copyright © 2015 mac. All rights reserved.
//

#import "FMDBStore.h"
#import <FMDB/FMDB.h>

#define CREATE_TABLE_SQL @"CREATE TABLE IF NOT EXISTS FMDBTABLE (key TEXT, attr1 TEXT)"
#define UPDATE_TABLE_SQL @"INSERT INTO FMDBTABLE (key, attr1) VALUES (?,?)"
#define SELECT_TABLE_SQL @"SELECT * FROM FMDBTABLE WHERE key = %@"
#define UPDATE_ALL @"UPDATE FMDBTABLE SET attr1 = 5"

#define kPATH_SQLite_FileName @"User.sqlite"
#define kPATH_SQLite_FilePath [[self applicationDocumentsDirectory] stringByAppendingPathComponent:kPATH_SQLite_FileName]

@interface FMDBStore()

@property (nonatomic, strong)NSString *dbPath;
@property (nonatomic, strong)FMDatabase *db;

@end

@implementation FMDBStore

- (instancetype)init{
    if (self = [super init]) {
        [self configureDataBase];
    }
    return self;
}

- (void)configureDataBase{
    _dbPath = kPATH_SQLite_FilePath;
    _db = [[FMDatabase alloc] initWithPath:_dbPath];
    [_db open];
    [_db executeStatements:CREATE_TABLE_SQL];    
}
- (void)insertOrUpdateWithKey:(NSString *)key attr1:(NSString *)attr1
{
    [_db executeUpdate:UPDATE_TABLE_SQL,
     key,
     attr1];
}
- (NSString *)applicationDocumentsDirectory{
    return [NSString stringWithFormat:@"%@", [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:YES error:nil]];
}

- (id)findWithKey:(NSString *)key{
    NSString *SQL = [NSString stringWithFormat:SELECT_TABLE_SQL, key];
    FMResultSet *s = [_db executeQuery:SQL];
    return s;
}
- (void)updateAll{
    [_db executeUpdate:UPDATE_ALL];
}

@end
