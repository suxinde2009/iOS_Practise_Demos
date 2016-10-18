//
//  ViewController.m
//  TestSplitPieces
//
//  Created by suxinde on 16/9/12.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSString  *curfilePath;
@property (nonatomic, strong) NSString *tmpDataPath;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.curfilePath =
    [[NSBundle mainBundle] pathForResource:@"IMG_4157" ofType:@"m4v"];

    self.tmpDataPath = [[[self class] tcpFileCacheDir] stringByAppendingPathComponent:@"tmp.m4v"];
    
}

+ (NSString *)tcpFileCacheDir
{
    NSString *filePath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject];
    NSString *tcpFileCacheDir = [filePath stringByAppendingPathComponent:@"TmpCacheDir"];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL isDirectory = NO;
    BOOL isExisting = [fileManager fileExistsAtPath:tcpFileCacheDir isDirectory:&isDirectory];
    
    if (!(isExisting && isDirectory)) {
        BOOL createDirectory = [fileManager createDirectoryAtPath:tcpFileCacheDir
                                      withIntermediateDirectories:YES
                                                       attributes:nil
                                                            error:nil];
        if (!createDirectory) {
            NSLog(@"创建自动同步到云端的文件目录失败");
        }
    }
    
    
    return tcpFileCacheDir;
}

- (IBAction)click:(id)sender {
    
    NSString *fileName = @"IMG_4157.m4v";
    
    
    
    int64_t fileSize = [[NSFileHandle fileHandleForReadingAtPath:self.curfilePath] seekToEndOfFile];

    
    int pieceDataSize = 512 * 1024;
    
    int64_t offset = 0;
    
    while (offset < fileSize) {
        NSFileHandle *fh1 = [NSFileHandle fileHandleForReadingAtPath:self.curfilePath];
        int64_t restFileSize = (fileSize - offset);
        int64_t pieceOfDataSizeToSend = MIN(restFileSize, pieceDataSize);
        [fh1 seekToFileOffset:offset];
        NSData *tmpData = [fh1 readDataOfLength:pieceOfDataSizeToSend];
        
        [self appendFileAtPath:self.tmpDataPath data:tmpData];
        offset += pieceOfDataSizeToSend;
        @autoreleasepool {
            tmpData = nil;
        }
    }
  
    NSLog(@"Done");
    
    
}


- (void)sendPieceOfDataFromOffset:(int64_t)offset
{
    NSLog(@"%s: offset %@", __func__, @(offset));
    
    // 每次8KB
    int pieceDataSize = 8 * 1024;
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForReadingAtPath:self.curfilePath];
    int64_t fileSize = [fileHandle seekToEndOfFile];
    int64_t restFileSize = (fileSize - offset);
    NSData *tmpData = nil;
    
    int64_t pieceOfDataSizeToSend = MIN(restFileSize, pieceDataSize);
    [fileHandle seekToFileOffset:offset];
    tmpData = [fileHandle readDataOfLength:pieceOfDataSizeToSend];
    

    
    int64_t sentData = offset + tmpData.length;
    

    
    
    
    
//    [self.cacheData appendData:tmpData];
//    if (self.cacheData.length > (5 * 1024 * 1024)) {
//        NSString *filePath = [[TcpFileCacheDirUtils tcpFileCacheDir] stringByAppendingPathComponent:[NSString stringWithFormat:@"send_%@", @(self.pieceNumber)]];
//        [self.cacheData writeToFile:filePath atomically:YES];
//        self.cacheData = [NSMutableData data];
//        self.pieceNumber++;
//    }
    
    
    
    @autoreleasepool {
        tmpData = nil;
    }
}



- (void)appendFileAtPath:(NSString *)path data:(NSData *)data
{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    BOOL fileExits = [fileManager fileExistsAtPath:path];
    if (!fileExits) {
        [data writeToFile:path atomically:YES];
        return;
    }
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:path];
    [fileHandle seekToEndOfFile];
    [fileHandle writeData:data];
    [fileHandle closeFile];
}

@end
