//
//  ViewController.m
//  CRC32Demo
//
//  Created by suxinde on 16/10/18.
//  Copyright © 2016年 com.meitu. All rights reserved.
//

#import "ViewController.h"

//
#import <zlib.h>
#import "MyCRC32.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 自己实现的crc32
    char *str="sdfdsfdsfdsfdsfdssdfdsfdsfdsfdsssssssssssssfdsfdsfds";
    printf("%lld\n",my_crc32(str,strlen(str)));//1743817077
    
    // zilb crc32
    uLong crc = crc32(0L, Z_NULL, 0);
    crc = crc32(crc, str, (uInt)strlen(str));
    printf("%lld\n", crc); //1743817077
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end



