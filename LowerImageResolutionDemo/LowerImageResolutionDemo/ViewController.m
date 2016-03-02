//
//  ViewController.m
//  LowerImageResolutionDemo
//
//  Created by zj－db0367 on 16/2/29.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"test.png"];
    
//    UIImage *newImage = [[self class] image:image];
    
    
    NSData *pngData = UIImageJPEGRepresentation(image, 0.7);//UIImagePNGRepresentation(newImage);
    UIImage *image2 = [[UIImage alloc] initWithData:pngData];
    
    pngData = UIImagePNGRepresentation(image2);
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:@"test3.png"];
    
    [pngData writeToFile:filePath atomically:YES];
    
//    NSString *usr_dir_name = [NSString stringWithFormat:@"user_%lld", usrId];
//    NSString *userDirPath = [documentsDirectory stringByAppendingPathComponent:usr_dir_name];
//    NSString *userDefaultUploadDirPath = [userDirPath stringByAppendingPathComponent:kMTUploadTaskRecorderDirectory];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//+ (UIImage *)image:(UIImage *)image
//{
//    CGSize imgSize = image.size;
//    UIGraphicsBeginImageContextWithOptions(imgSize, false, image.scale);
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    
//    CGContextSetInterpolationQuality(context, kCGInterpolationMedium);
//    [image drawInRect:CGRectMake(0, 0, imgSize.width, imgSize.height)];
//    
//    UIImage *lowerResolutionImage = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    return lowerResolutionImage;
//
//}

@end

