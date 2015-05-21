//
//  OpenNewWindowViewController.h
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/17/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "InformationWindow.h"


@interface OpenNewWindowViewController : UIViewController<ButtonProtocolName>
@property (nonatomic, strong) InformationWindow         *informationWindow;
@end
