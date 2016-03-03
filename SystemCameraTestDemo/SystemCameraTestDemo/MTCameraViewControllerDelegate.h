//
//  MTCameraViewControllerDelegate.h
//  SystemCameraTestDemo
//
//  Created by su xinde on 16/3/3.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol MTCameraViewControllerDelegate <NSObject>
@optional
- (void)cameraController:(UIViewController *)viewController
      didFinishWithImage:(UIImage *)image;

- (void)cameraController:(UIViewController *)viewController
   didFinishWithVideoURL:(NSURL *)videoURL;

- (void)cameraControllerDidCancel:(UIViewController *)viewController;
@end
