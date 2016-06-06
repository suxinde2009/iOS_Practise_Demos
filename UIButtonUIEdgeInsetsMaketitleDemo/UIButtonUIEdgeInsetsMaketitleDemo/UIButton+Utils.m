//
//  UIButton+Utils.m
//  UIButtonUIEdgeInsetsMaketitleDemo
//
//  Created by suxinde on 16/6/6.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import "UIButton+Utils.h"

@implementation UIButton (Utils)


- (void)tilteRight
{
    
}

- (void)titleOverImage
{
    UIImage *backGroundImag = self.currentImage;
    [self setTitleEdgeInsets:UIEdgeInsetsMake( 0.0,-backGroundImag.size.width, 0.0,0.0)];
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -self.titleLabel.bounds.size.width)];

}

- (void)titleUpImage
{
    UIImage *backGroundImag = self.currentImage;
    [self setTitleEdgeInsets:UIEdgeInsetsMake( -80.0,-backGroundImag.size.width, 0.0,0.0)];
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -self.titleLabel.bounds.size.width)];
}

- (void)titleUnderImage
{
    UIImage *backGroundImag = self.currentImage;
    
    [self setTitleEdgeInsets:UIEdgeInsetsMake( 80.0,-backGroundImag.size.width, 0.0,0.0)];
    
    [self setImageEdgeInsets:UIEdgeInsetsMake(0.0, 0.0,0.0, -self.titleLabel.bounds.size.width)];
}

@end
