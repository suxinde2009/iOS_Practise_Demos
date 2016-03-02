//
//  XDDBManager.m
//  FMDBMigrationDemo
//
//  Created by Su XinDe on 16/3/2.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import "XDDBManager.h"

@implementation XDDBManager

+ (NSString *)dbPath
{
    NSString *usr_db_file_name = [NSString stringWithFormat:@"user_111"];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString* dirPath = [documentsDirectory stringByAppendingPathComponent:usr_db_file_name];
    NSFileManager* fileManager = [NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:dirPath]) {
        [fileManager createDirectoryAtPath:dirPath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    
    // 该用户的db是否存在，若不存在则创建相应的DB目录
    BOOL isDirectory = NO;
    BOOL isExisting = [fileManager fileExistsAtPath:dirPath isDirectory:&isDirectory];
    
    if (!(isExisting && isDirectory)) {
        BOOL createDirectory = [fileManager createDirectoryAtPath:dirPath
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:nil];
        if (!createDirectory) {
            NSLog(@"创建DB目录失败");
        }
    }
    
    NSString *dbPath = [dirPath stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db", usr_db_file_name]];
    return dbPath;

}



@end
