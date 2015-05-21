//
//  ImgSlideTableViewCell.h
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/19/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SliderPageControl.h"

@interface ImgSlideTableViewCell : UITableViewCell <SliderPageControlDelegate, UIScrollViewDelegate>
{
    
//    UIScrollView*_scrollview;
//    UIButton*_button;
    UIPageControl*_pgcontrol;
//    NSArray*_images;
//    UIImageView*_backgroundimageview;

}
@property (nonatomic, strong) SliderPageControl *sliderPageControl;
//@property (nonatomic, strong) NSMutableArray *demoContent;
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL pageControlUsed;

- (void)slideToCurrentPage:(bool)animated;
- (void)changeToPage:(int)page animated:(BOOL)animated;


@end
