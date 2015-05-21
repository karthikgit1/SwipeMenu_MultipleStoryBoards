//
//  ImgSlideTableViewCell.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/19/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "ImgSlideTableViewCell.h"

@implementation ImgSlideTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    NSLog(@"reuseIdentifier is %@",reuseIdentifier);
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self )
    {
        float screen_Height;
        float screen_Width;
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue]  >= 8)
        {
            screen_Height = [[UIScreen mainScreen] bounds].size.height;
            screen_Width = [[UIScreen mainScreen] bounds].size.width;
        }
        else
        {
            screen_Height = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width);
            screen_Width = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height);
        }

        UIImage*i1 = [UIImage imageNamed:@"1"];
        UIImage*i2 = [UIImage imageNamed:@"2"];
        UIImage*i3 = [UIImage imageNamed:@"3"];
        UIImage*i4 = [UIImage imageNamed:@"4"];
        UIImage*i5 = [UIImage imageNamed:@"5"];
        UIImage*i6 = [UIImage imageNamed:@"6"];
        UIImage*i7 = [UIImage imageNamed:@"7"];
        UIImage*i8 = [UIImage imageNamed:@"8"];
        UIImage*i9 = [UIImage imageNamed:@"1"];
        
        NSArray * images =@[i1,i2,i3,i4,i5,i2,i6,i7,i8,i9];
        
       // [self.view setBackgroundColor:[UIColor blackColor]];
        
        //		_demoContent = [NSMutableArray array];
        //		NSMutableDictionary *page1 = [NSMutableDictionary dictionary];
        //		[page1 setObject:@"RED" forKey:@"title"];
        //		[page1 setObject:[UIColor redColor] forKey:@"color"];
        //		[_demoContent addObject:page1];
        //		NSMutableDictionary *page2 = [NSMutableDictionary dictionary];
        //		[page2 setObject:@"ORANGE" forKey:@"title"];
        //		[page2 setObject:[UIColor orangeColor] forKey:@"color"];
        //		[_demoContent addObject:page2];
        //		NSMutableDictionary *page3 = [NSMutableDictionary dictionary];
        //		[page3 setObject:@"YELLOW" forKey:@"title"];
        //		[page3 setObject:[UIColor yellowColor] forKey:@"color"];
        //		[_demoContent addObject:page3];
        //		NSMutableDictionary *page4 = [NSMutableDictionary dictionary];
        //		[page4 setObject:@"GREEN" forKey:@"title"];
        //		[page4 setObject:[UIColor greenColor] forKey:@"color"];
        //		[_demoContent addObject:page4];
        //		NSMutableDictionary *page5 = [NSMutableDictionary dictionary];
        //		[page5 setObject:@"BLUE" forKey:@"title"];
        //		[page5 setObject:[UIColor blueColor] forKey:@"color"];
        //		[_demoContent addObject:page5];
        //		NSMutableDictionary *page6 = [NSMutableDictionary dictionary];
        //		[page6 setObject:@"PURPLE" forKey:@"title"];
        //		[page6 setObject:[UIColor purpleColor] forKey:@"color"];
        //		[_demoContent addObject:page6];
        
        
        CGRect svrect_ = CGRectZero;
        // svrect_.size.height = self.contentView.bounds.size.height;
        svrect_.size.height = 200;
        //svrect_.size.width = self.contentView.bounds.size.width;
        svrect_.size.width = screen_Width;
        
        CGPoint svcenter_ = CGPointZero;
        svcenter_.x = self.contentView.center.x;
        svcenter_.y = self.contentView.center.y-50;
        
        CGSize svconsize = CGSizeZero;
        svconsize.height = svrect_.size.height;
        svconsize.width = svrect_.size.width * images.count;
        
        CGPoint pgconcenter_ = CGPointZero;
        pgconcenter_.x = self.contentView.center.x;
        pgconcenter_.y = svcenter_.y + (svrect_.size.height) + 20;

        
        _scrollView = [[UIScrollView alloc] initWithFrame:svrect_];
        [_scrollView setPagingEnabled:YES];
        [_scrollView setContentSize:CGSizeMake([images count]*self.scrollView.frame.size.width, self.scrollView.frame.size.height)];
        [_scrollView setShowsHorizontalScrollIndicator:NO];
        [_scrollView setDelegate:self];
        [self.contentView addSubview:_scrollView];
        
//        _sliderPageControl = [[SliderPageControl  alloc] initWithFrame:CGRectMake(0,[self.contentView bounds].size.height-20,[self.contentView bounds].size.width,20)];
//        [_sliderPageControl addTarget:self action:@selector(onPageChanged:) forControlEvents:UIControlEventValueChanged];
//        [_sliderPageControl setDelegate:self];
//        [_sliderPageControl setShowsHint:YES];
//        _sliderPageControl.center = pgconcenter_;
        
        
//        _sliderPageControl = [[SliderPageControl  alloc] initWithFrame:CGRectMake(0,[self.contentView bounds].size.height-20,[self.contentView bounds].size.width,20)];
//        [_sliderPageControl addTarget:self action:@selector(onPageChanged:) forControlEvents:UIControlEventValueChanged];
//        [_sliderPageControl setDelegate:self];
//        [_sliderPageControl setShowsHint:YES];
//        _sliderPageControl.center = pgconcenter_;

        
        _pgcontrol = [[UIPageControl alloc] initWithFrame:CGRectZero];
        _pgcontrol.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
        _pgcontrol.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.6 alpha:1];
        _pgcontrol.numberOfPages = images.count;
        _pgcontrol.currentPage = 0;
        // [_pgcontrol sizeToFit];
        _pgcontrol.center = pgconcenter_;
        [self.contentView addSubview:_pgcontrol];

        
        
        for (int i=0; i<[images count]; i++)
        {
            // create image
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
            // create imageView
            UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*_scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height)];
            // set scale to fill
            imgV.contentMode=UIViewContentModeScaleToFill;
            
            // set image
            [imgV setImage:image];
            // apply tag to access in future
            imgV.tag=i+1;
            // add to scrollView
            [_scrollView addSubview:imgV];
            
        }
        
        [self changeToPage:0 animated:NO];
    }
    return self;


}

#pragma mark scrollview delegate

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView_
{
    self.pageControlUsed = NO;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (self.pageControlUsed)
    {
        return;
    }
    
    CGFloat pageWidth = self.scrollView.frame.size.width;
    int page = floor((self.scrollView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    [self.sliderPageControl setCurrentPage:page animated:YES];
    
    int page_ = (int)round(scrollView.contentOffset.x / scrollView.frame.size.width);
    
    _pgcontrol.currentPage = page_;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView_
{
    self.pageControlUsed = NO;
}

#pragma mark sliderPageControlDelegate

- (NSString *)sliderPageController:(id)controller hintTitleForPage:(NSInteger)page
{
    //	NSString *hintTitle = [[self.demoContent objectAtIndex:page] objectForKey:@"title"];
    //	return hintTitle;
    
    return @"sss";
}

- (void)onPageChanged:(id)sender
{
    self.pageControlUsed = YES;
    [self slideToCurrentPage:YES];
}

- (void)slideToCurrentPage:(bool)animated
{
    int page = self.sliderPageControl.currentPage;
    
    CGRect frame = self.scrollView.frame;
    frame.origin.x = frame.size.width * page;
    frame.origin.y = 0;
    [self.scrollView scrollRectToVisible:frame animated:animated];
}

- (void)changeToPage:(int)page animated:(BOOL)animated
{
    [self.sliderPageControl setCurrentPage:page animated:YES];
    [self slideToCurrentPage:animated];
}

@end
