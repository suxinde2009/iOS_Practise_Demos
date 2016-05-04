//
//  ViewController.m
//  SSKeychainDemo
//
//  Created by suxinde on 16/4/26.
//  Copyright © 2016年 suxinde. All rights reserved.
//

#import "ViewController.h"

#import "XDDeviceUUID.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *originDeviceUuidLbl;
@property (nonatomic, weak) IBOutlet UILabel *refreshedDeviceUuidLbl;
@property (nonatomic, weak) IBOutlet UITextView *originDeviceUuidTxtView;
@property (nonatomic, weak) IBOutlet UITextView *refreshedDeviceUuidTxtView;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.originDeviceUuidTxtView.editable = NO;
    self.refreshedDeviceUuidTxtView.editable = NO;
    
    self.originDeviceUuidTxtView.text = [NSString stringWithFormat:@"%@", [XDDeviceUUID UUID]];
    NSLog(@"%@", [NSString stringWithFormat:@"原先的设备id: \n%@", [XDDeviceUUID UUID]]);
}

- (IBAction)resetDeviceUUID:(id)sender
{
    [XDDeviceUUID setUUID:[NSUUID UUID].UUIDString];
    self.refreshedDeviceUuidTxtView.text = [NSString stringWithFormat:@"%@", [XDDeviceUUID UUID]];
    NSLog(@"%@", [NSString stringWithFormat:@"更新后的设备id: \n%@", [XDDeviceUUID UUID]]);
}

@end
