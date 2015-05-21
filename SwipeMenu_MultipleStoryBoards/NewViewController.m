//
//  NewViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/19/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "NewViewController.h"

@interface NewViewController ()
{
    UIPageControl*_pgcontrol;
    NSArray*_images;
    UIImageView*_backgroundimageview;
}
@end

@implementation NewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
    [self setPhotoSlide];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page_ = (int)round(scrollView.contentOffset.x / scrollView.frame.size.width);
   
    _pgcontrol.currentPage = page_;
}


-(void)setPhotoSlide
{
    
    // we have 10 images here.
    // we will add all images into a scrollView &amp; set the appropriate size.
    
    self.scrollview.showsVerticalScrollIndicator = NO;
    self.scrollview.pagingEnabled = YES;
    self.scrollview.showsHorizontalScrollIndicator = NO;
    self.scrollview.bounces = false;
    self.scrollview.delegate = self;
    
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
    
    _images = images;
    
    /**
     *  positions
     */
    
    CGRect svrect_ = CGRectZero;
    svrect_.size.height = self.scrollview.bounds.size.height;
    svrect_.size.width = self.scrollview.bounds.size.width;
    
    CGPoint svcenter_ = CGPointZero;
    svcenter_.x = self.scrollview.center.x;
    svcenter_.y = self.scrollview.center.y-50;
    
//    CGSize svconsize = CGSizeZero;
//    svconsize.height = svrect_.size.height;
//    svconsize.width = svrect_.size.width * images.count;
    
    CGPoint pgconcenter_ = CGPointZero;
    pgconcenter_.x = self.view.center.x;
    pgconcenter_.y = svcenter_.y + (svrect_.size.height/2) + 20;

    
    _pgcontrol = [[UIPageControl alloc] initWithFrame:CGRectZero];
    
    _pgcontrol.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    _pgcontrol.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.6 alpha:1];
    _pgcontrol.numberOfPages = _images.count;
    _pgcontrol.currentPage = 0;
    [_pgcontrol sizeToFit];
    
    
    _pgcontrol.center = pgconcenter_;
    
    [self.view addSubview:_pgcontrol];
    
    for (int i=1; i <=[_images count]; i++)
    {
        // create image
        UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
        // create imageView
        UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*self.scrollview.frame.size.width, 0, self.scrollview.frame.size.width, self.scrollview.frame.size.height)];
        // set scale to fill
        imgV.contentMode=UIViewContentModeScaleToFill;
        
        // set image
        [imgV setImage:image];
        // apply tag to access in future
        imgV.tag=i+1;
        // add to scrollView
        [self.scrollview addSubview:imgV];
    }
    // set the content size to 10 image width
    [self.scrollview setContentSize:CGSizeMake(self.scrollview.frame.size.width* [_images count], self.scrollview.frame.size.height)];
    // enable timer after each 2 seconds for scrolling.
    //        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
    
}


@end
