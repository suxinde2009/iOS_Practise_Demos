//
//  AutoLayoutProgramaticallyVC.m
//  AutoLayoutDemystified
//
//  Created by zj－db0367 on 15/7/20.
//  Copyright (c) 2015年 com.su. All rights reserved.
//

#import "AutoLayoutProgramaticallyVC.h"

// http://blog.csdn.net/mozixiong/article/details/14165391

@interface AutoLayoutProgramaticallyVC ()

@property (nonatomic, strong) UILabel *headerLbl;
@property (nonatomic, strong) UIImageView *imgView;
@property (nonatomic, strong) UIView *boxView;
@property (nonatomic, strong) UIButton *doneBtn;
@property (nonatomic, strong) UIButton *backBtn;

@property (unsafe_unretained, nonatomic) int testCnt;
@property (strong, nonatomic) NSMutableArray *dataArray;

@end

@implementation AutoLayoutProgramaticallyVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _boxView = [[UIView alloc] init];
    [_boxView setTranslatesAutoresizingMaskIntoConstraints:NO];
    _boxView.backgroundColor = [UIColor brownColor];
    [self.view addSubview:_boxView];
    
    
    _headerLbl = [[UILabel alloc] init];
    _headerLbl.backgroundColor = [UIColor purpleColor];
    _headerLbl.lineBreakMode = NSLineBreakByCharWrapping;
    _headerLbl.numberOfLines = 10;
    _headerLbl.font = [UIFont systemFontOfSize:15.0f];
    _headerLbl.preferredMaxLayoutWidth = 270.0f; // Notice! important, label not init from xib, must be set this property!
    [_headerLbl setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_boxView addSubview:_headerLbl];
    
    _imgView = [[UIImageView alloc] init];
    _imgView.backgroundColor = [UIColor yellowColor];
    _imgView.contentMode = UIViewContentModeScaleAspectFit;
    [_imgView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_boxView addSubview:_imgView];
    
    _backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_backBtn setTitle:@"Back"
              forState:UIControlStateNormal];
    [_backBtn addTarget:self
                 action:@selector(done:)
       forControlEvents:UIControlEventTouchUpInside];
    [_backBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_boxView addSubview:_backBtn];
    
    _doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_doneBtn setTitle:@"Test"
              forState:UIControlStateNormal];
    [_doneBtn addTarget:self
                 action:@selector(test:)
       forControlEvents:UIControlEventTouchUpInside];
    [_doneBtn setTranslatesAutoresizingMaskIntoConstraints:NO];
    [_boxView addSubview:_doneBtn];
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_boxView,
                                                          _headerLbl,
                                                          _imgView,
                                                          _backBtn,
                                                          _doneBtn);
    
    NSDictionary *metrics = @{@"hPadding":@5,
                              @"vPadding":@5,
                              @"imageEdge":@150};
    NSString *vfl = @"|-hPadding-[_boxView]-hPadding-|";
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:vfl
                                                                      options:0
                                                                      metrics:metrics
                                                                        views:views]];
    
    
    
}


- (void)test:(id)sender
{
    //We don't need this anymore
    /*
     if([[UIDevice currentDevice].systemVersion floatValue]<7.0){
     CGSize titleS = [title sizeWithFont:[_headerL font]
     constrainedToSize:CGSizeMake(270.0, CGFLOAT_MAX)
     lineBreakMode:NSLineBreakByWordWrapping];
     
     _headerL.frame = CGRectMake(_headerL.frame.origin.x, _headerL.frame.origin.y,
     _headerL.frame.size.width, titleS.height);
     }else{
     CGRect titleR = [title boundingRectWithSize:CGSizeMake(270.0, CGFLOAT_MAX)
     options:NSStringDrawingUsesLineFragmentOrigin
     attributes:nil
     context:nil];
     headerL.frame = CGRectMake(_headerL.frame.origin.x, _headerL.frame.origin.y,
     _headerL.frame.size.width, titleR.size.height);
     }
     */
}

- (void)done:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}



@end
