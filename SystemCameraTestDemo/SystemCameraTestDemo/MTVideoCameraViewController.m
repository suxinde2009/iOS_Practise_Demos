//
//  MTVideoCameraViewController.m
//  SystemCameraTestDemo
//
//  Created by su xinde on 16/3/3.
//  Copyright © 2016年 com.su. All rights reserved.
//

#import "MTVideoCameraViewController.h"
#import <CoreFoundation/CoreFoundation.h>

static NSString *const kUTTypeMovie = @"public.movie";

@interface MTVideoCameraViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@end

@implementation MTVideoCameraViewController

- (instancetype)init {
    if (self = [super init]){
        [self commonConfig];
    }
    return self;
}

- (void)commonConfig
{
    self.modalPresentationStyle = UIModalPresentationCurrentContext;
    self.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    self.mediaTypes = @[kUTTypeMovie];
    self.videoQuality = UIImagePickerControllerQualityTypeHigh;
    self.videoMaximumDuration = 300.0f;//20.0f;
    self.cameraCaptureMode = UIImagePickerControllerCameraCaptureModeVideo;
    self.delegate = self;
}


#pragma mark - UIImagePickerViewControllerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    if (info[UIImagePickerControllerOriginalImage]) { // 照片
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        if ([self.cameraDelegate respondsToSelector:@selector(cameraController:didFinishWithImage:)]) {
            [self.cameraDelegate cameraController:self didFinishWithImage:image];
        }
    }else { // 视频
        NSURL *videoURL = info[UIImagePickerControllerMediaURL];
        if ([self.cameraDelegate respondsToSelector:@selector(cameraController:didFinishWithVideoURL:)]) {
            [self.cameraDelegate cameraController:self didFinishWithVideoURL:videoURL];
        }
    }
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    if ([self.cameraDelegate respondsToSelector:@selector(cameraControllerDidCancel:)]) {
        [self.cameraDelegate cameraControllerDidCancel:self];
    }
}


@end
