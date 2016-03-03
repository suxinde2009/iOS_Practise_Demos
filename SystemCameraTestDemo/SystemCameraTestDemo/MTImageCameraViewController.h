//
//  MTImageCameraViewController.h
//  SystemCameraTestDemo
//
//  Created by su xinde on 16/3/3.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MTCameraViewControllerDelegate.h"

@interface MTImageCameraViewController : UIImagePickerController

@property (nonatomic, assign) id<MTCameraViewControllerDelegate> cameraDelegate;

@end
