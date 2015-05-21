//
//  BubbleChatViewController.h
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/7/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Message.h"
#import <QuartzCore/QuartzCore.h>
@interface BubbleChatViewController : UIViewController

{
    NSArray *styleArray;
    NSMutableString *str;
    Message *message;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;


@end
