//
//  ComplexViewController.h
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/19/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ComplexViewController : UIViewController<UIScrollViewDelegate>
{
    CGFloat _lastPosition;
    BOOL hidden;
    BOOL isAnimating;
}
@property (weak, nonatomic) IBOutlet UITableView *tv1;
@property (weak, nonatomic) UINavigationController* navController;

@property (weak, nonatomic) IBOutlet UIView *vw1;
//@property (weak, nonatomic) IBOutlet UIView *vw2;
@property (weak, nonatomic) IBOutlet UIButton *btnl1;
@property (weak, nonatomic) IBOutlet UIButton *btnr1;

@end
