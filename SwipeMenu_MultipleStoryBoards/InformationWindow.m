//
//  InformationWindow.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/17/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "InformationWindow.h"
#import <QuartzCore/QuartzCore.h>
@implementation InformationWindow

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@synthesize delegate=_connectionDelegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

 InformationWindow      *_baseWindow;

+(void)openWindow
{
    if(_baseWindow == nil)
    {
        // Window作成
        CGRect rect = [[UIScreen mainScreen] bounds];
        _baseWindow = [[InformationWindow alloc] initWithFrame:rect];
        _baseWindow.hidden = YES;
        _baseWindow.windowLevel = UIWindowLevelNormal + 1;
        _baseWindow.backgroundColor = [UIColor colorWithWhite:1.0f alpha:0.4f];
        
        // View作成
        UIView *informationView = [[UIView alloc] initWithFrame:CGRectMake(0.0f,0.0f,200.0f, 200.0f)];
        informationView.backgroundColor = [UIColor blueColor];
        informationView.layer.cornerRadius = 10.0f;
        informationView.layer.masksToBounds = YES;
        
        /*
        UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        [indicatorView startAnimating];
        [informationView addSubview:indicatorView];
        
        
        indicatorView.center = informationView.center;
         */
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        
       // [button addTarget:self action:@selector(aMethod) forControlEvents:UIControlEventTouchUpInside];
        
        [button addTarget:self
                   action:@selector(aMethod:)
                forControlEvents:UIControlEventTouchUpInside];
        
        
        [button setTitle:@"Show View" forState:UIControlStateNormal];
        button.frame = CGRectMake(10.0, 20.0, 160.0, 40.0);
        button.backgroundColor = [UIColor whiteColor];
        
        
        [informationView addSubview:button];
        
        
        // プロパティに保持
        _baseWindow.rootView = informationView;
        [_baseWindow addSubview:informationView];
        
        // センタリング
        informationView.center = _baseWindow.center;
    }
    _baseWindow.alpha = 0.0f;
    _baseWindow.hidden = NO;
    // フェードイン
    
    [UIView animateWithDuration:0.3f animations:^{
        _baseWindow.alpha = 1.0f;
    } completion:^(BOOL finished) {
        // 5秒で消す
        //[self performSelector:@selector(closeWindow) withObject:nil afterDelay:5.0f];
    }];
    
    
}

+ (void)closeWindow {
    // フェードアウト
    [UIView animateWithDuration:0.3f animations:^{
        _baseWindow.alpha = 0.0f;
    } completion:^(BOOL finished) {
        _baseWindow.hidden = YES;
        [_baseWindow.rootView removeFromSuperview];
        _baseWindow.rootView = nil;
        _baseWindow = nil;
    }];
}

+(void)aMethod:(UIButton *)paramSender
{
    [_baseWindow->_connectionDelegate buttonWasPressed];

    //[InformationWindow closeWindow];
}
@end
