//
//  ViewController.m
//  GetVideoSnapshotForThumbnailWithVideoFilePathDemo
//
//  Created by su xinde on 15/12/26.
//  Copyright © 2015年 com.su. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, weak) IBOutlet UIImageView *imgView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (IBAction)clickAction:(id)sender
{
    NSString *videoPath = [[NSBundle mainBundle] pathForResource:@"IMG_4610" ofType:@"m4v"];
    NSURL *assetURL = [NSURL fileURLWithPath:videoPath];
    
    UIImage *imag = [self loadImage:assetURL];
    
    self.imgView.image = imag;
}


- (UIImage*)loadImage:(NSURL *)videoURL {
    
    AVURLAsset *asset = [[AVURLAsset alloc] initWithURL:videoURL options:nil];
    AVAssetImageGenerator *generate = [[AVAssetImageGenerator alloc] initWithAsset:asset];
    NSError *err = NULL;
    CMTime time = CMTimeMake(1, 60);
    CGImageRef imgRef = [generate copyCGImageAtTime:time actualTime:NULL error:&err];
    NSLog(@"err==%@, imageRef==%@", err, imgRef);
    
    return [[UIImage alloc] initWithCGImage:imgRef];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
