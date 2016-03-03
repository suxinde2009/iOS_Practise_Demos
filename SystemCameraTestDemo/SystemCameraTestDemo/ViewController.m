//
//  ViewController.m
//  SystemCameraTestDemo
//
//  Created by su xinde on 16/3/3.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import "ViewController.h"
#import <UIKit/UIKit.h>

#import "MTVideoCameraViewController.h"
#import "MTImageCameraViewController.h"


@interface ViewController () <MTCameraViewControllerDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)click:(id)sender
{

    MTImageCameraViewController *imageCameraViewController = [[MTImageCameraViewController alloc] init];
    imageCameraViewController.cameraDelegate = self;
    
    [self presentViewController:imageCameraViewController animated:YES completion:nil];
   

}

- (IBAction)clickRecordVideo:(id)sender
{
    MTVideoCameraViewController *cameraVideoController = [[MTVideoCameraViewController alloc] init];
    cameraVideoController.videoMaximumDuration = 300.0f;//20.0f;
    cameraVideoController.cameraDelegate = self;
    
    [self presentViewController:cameraVideoController animated:YES completion:nil];

}


#pragma mark - UIImagePickerControllerDelegate

- (void)cameraController:(UIViewController *)viewController
      didFinishWithImage:(UIImage *)image
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraController:(UIViewController *)viewController
   didFinishWithVideoURL:(NSURL *)videoURL
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)cameraControllerDidCancel:(UIViewController *)viewController
{
     [self dismissViewControllerAnimated:YES completion:nil];
}

@end



