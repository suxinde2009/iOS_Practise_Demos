//
//  MTVideoCameraViewController.h
//  SystemCameraTestDemo
//
//  Created by su xinde on 16/3/3.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MTCameraViewControllerDelegate.h"

@interface MTVideoCameraViewController : UIImagePickerController

@property (nonatomic, assign) id<MTCameraViewControllerDelegate> cameraDelegate;

@end
