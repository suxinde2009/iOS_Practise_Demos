//
//  AppDelegate.m
//  GameDemo01
//
//  Created by SuXinDe on 16/5/29.
//  Copyright © 2016年 SuXinDe. All rights reserved.
//

#import "AppDelegate.h"
#import "RootViewController.h"

#import "HelloLayer.h"
#import "HelloScene.h"

#import <cocos2d.h>


@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Init the window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    CCDirector *director = [CCDirector sharedDirector];
    
    // Init the View Controller
    viewController = [[RootViewController alloc] init];
    viewController.wantsFullScreenLayout = YES;
    
    //
    // Create the EAGLView manually
    //  1. Create a RGB565 format. Alternative: RGBA8
    //	2. depth format of 0 bit. Use 16 or 24 bit for 3d effects, like CCPageTurnTransition
    //
    //
    EAGLView *glView = [EAGLView viewWithFrame:[window bounds]
                                   pixelFormat:kEAGLColorFormatRGB565	// kEAGLColorFormatRGBA8
                                   depthFormat:0						// GL_DEPTH_COMPONENT16_OES
                        ];
    
    // attach the openglView to the director
    [director setOpenGLView:glView];

    //[director setDeviceOrientation:kCCDeviceOrientationLandscapeRight];
    
    [director setAnimationInterval:(30.f/1000.0)];
    [director setDisplayFPS:NO];
    
    // make the OpenGLView a child of the view controller
    [viewController.view addSubview:glView];
    
    // make the View Controller a child of the main window
    //[window addSubview: viewController.view];
    [self.window setRootViewController:viewController];
    
    [self.window makeKeyAndVisible];
    
    // Default texture format for PNG/BMP/TIFF/JPEG/GIF images
    // It can be RGBA8888, RGBA4444, RGB5_A1, RGB565
    // You can change anytime.
    [CCTexture2D setDefaultAlphaPixelFormat:kCCTexture2DPixelFormat_RGBA8888];
    
    // Run the intro Scene
    [[CCDirector sharedDirector] runWithScene: [HelloScene node]];
    
    return YES;
}

@end
