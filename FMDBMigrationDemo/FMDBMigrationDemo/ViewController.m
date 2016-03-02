//
//  ViewController.m
//  FMDBMigrationDemo
//
//  Created by Su XinDe on 16/3/2.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import "ViewController.h"

#import "XDDBManager.h"
#import <FMDBMigrationManager.h>
#import <FMDB/FMDB.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    FMDatabase *db = [FMDatabase databaseWithPath:[XDDBManager dbPath]];
    
    FMDBMigrationManager *migrationManager = [FMDBMigrationManager managerWithDatabase:db
                                                                      migrationsBundle:[NSBundle mainBundle]];
    
    
    BOOL resultState = NO;
    if (!migrationManager.hasMigrationsTable) {
        resultState = [migrationManager createMigrationsTable:nil];
    }
    
    resultState = [migrationManager migrateDatabaseToVersion:UINT64_MAX progress:^(NSProgress *progress) {
        
    } error:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
