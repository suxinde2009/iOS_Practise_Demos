//
//  ViewController.m
//  YYKitTestDemo
//
//  Created by suxinde on 2017/2/23.
//  Copyright © 2017年 com.su. All rights reserved.
//

#import "ViewController.h"

#import <YYKit.h>

@interface ViewController ()

@property (nonatomic, weak) IBOutlet YYTextView *textView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:NSLocalizedString(@"留下一句话告诉你我有多美", nil)];
    
    NSInteger length = attr.length;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.firstLineHeadIndent = 5; // 调整行间距
    
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:15];
    
    [attr addAttribute:NSParagraphStyleAttributeName
                 value:paragraphStyle
                 range:NSMakeRange(0, length)];
    [attr addAttribute:NSFontAttributeName
                 value:font
                 range:NSMakeRange(0, length)];
//    [attr addAttribute:NSForegroundColorAttributeName
//                 value:RGBCOLOR(180, 181, 182)
//                 range:NSMakeRange(0, length)];

    
    _textView.placeholderAttributedText = attr;
//    _textView.text = @"YYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textViewYYTextView *textView";
   // _textView.editable = NO;
    
    
}

- (BOOL)textView:(YYTextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    
   NSLog(@"%f",textView.contentSize.height);
    
    
    
//    if (textView.contentSize.height >= 200) {
//        
//        textView.frame = CGRectMake(0,200- textView.contentSize.height , 200, 20 + textView.contentSize.height);
//        
//    }else{
//        
//        textView.frame = CGRectMake(0, 0, 200, 20 + textView.contentSize.height);
//        
//    }
//    
    return YES;
    
    
    
}


@end
