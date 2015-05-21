//
//  InformationWindow.h
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/17/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ButtonProtocolName

- (void)buttonWasPressed;

@end

@interface InformationWindow : UIWindow

@property (nonatomic, strong)   UIView                      *rootView;

@property (assign) id <ButtonProtocolName> delegate;

+ (void)openWindow;
+(void)closeWindow;
@end
