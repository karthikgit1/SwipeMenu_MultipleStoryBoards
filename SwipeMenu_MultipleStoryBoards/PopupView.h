//
//  PopupView.h
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/13/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol ButtonProtocolName

- (void)buttonWasPressed;

@end
@interface PopupView : UIView
@property (nonatomic, assign) id <ButtonProtocolName> delegate;

@property (weak, nonatomic) IBOutlet UIButton *btn1;


@end
