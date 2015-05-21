//
//  PhotoSlideViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/19/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "PhotoSlideViewController.h"
#define nextText @"next"
#define startText @"start"
@interface PhotoSlideViewController ()<UIScrollViewDelegate>
{
    UIScrollView*_scrollview;
    UIButton*_button;
    UIPageControl*_pgcontrol;
    NSArray*_images;
    UIImageView*_backgroundimageview;
}

@property (weak, nonatomic) IBOutlet UIPageControl *pgctrl;
@property (weak, nonatomic) IBOutlet UIScrollView *scrview;

@end

@implementation PhotoSlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
   // [self initwithimages];
    //[self showslide];
    
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

-(id)initwithimages
{
    UIImage*i1 = [UIImage imageNamed:@"101"];
    UIImage*i2 = [UIImage imageNamed:@"102"];
    UIImage*i3 = [UIImage imageNamed:@"103"];
    UIImage*i4 = [UIImage imageNamed:@"104"];
    UIImage*i5 = [UIImage imageNamed:@"105"];
    UIImage*i6 = [UIImage imageNamed:@"106"];
    UIImage*i7 = [UIImage imageNamed:@"107"];
    UIImage*i8 = [UIImage imageNamed:@"108"];
    UIImage*i9 = [UIImage imageNamed:@"109"];
    
    NSArray * images =@[i1,i2,i3,i4,i5,i2,i6,i7,i8,i9];
    
    if (self)
    {
        //check views length
        NSAssert(images.count!=0, @".views's length is zero.");
        
        /**
         *  setup viewcontroller
         */
       // self.view.backgroundColor = [UIColor whiteColor];
       // self.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
        _images = images;
        
        /**
         *  positions
         */
        CGRect svrect_ = CGRectZero;
        svrect_.size.height = self.view.bounds.size.height/3*2;
        svrect_.size.width = self.view.bounds.size.width;
        
        CGPoint svcenter_ = CGPointZero;
        svcenter_.x = self.view.center.x;
        svcenter_.y = self.view.center.y-50;
        
        CGSize svconsize = CGSizeZero;
        svconsize.height = svrect_.size.height;
        svconsize.width = svrect_.size.width * images.count;
        
        CGPoint pgconcenter_ = CGPointZero;
        pgconcenter_.x = self.view.center.x;
        pgconcenter_.y = svcenter_.y + (svrect_.size.height/2) + 20;
        
        CGRect btnrect_ = CGRectZero;
        btnrect_.size.width = 250;
        btnrect_.size.height = 50;
        
        CGPoint btncenter_ = CGPointZero;
        btncenter_.x = self.view.center.x;
        btncenter_.y = self.view.bounds.size.height-65;
        
              /*
         Views
         */
        _backgroundimageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
        [self.view addSubview:_backgroundimageview];
        
        _scrollview = [[UIScrollView alloc] initWithFrame:svrect_];
        _scrollview.center = svcenter_;
        _scrollview.backgroundColor = [UIColor redColor];
        _scrollview.contentSize = svconsize;
        _scrollview.pagingEnabled = true;
        _scrollview.bounces = false;
        _scrollview.delegate = self;
        _scrollview.layer.borderWidth = 0.5f;
        _scrollview.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
        _scrollview.showsHorizontalScrollIndicator = false;
        _scrollview.layer.cornerRadius = 2;
        [self.view addSubview:_scrollview];
        
        _pgcontrol = [[UIPageControl alloc] initWithFrame:CGRectZero];
        _pgcontrol.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
        _pgcontrol.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.6 alpha:1];
        _pgcontrol.numberOfPages = _images.count;
        _pgcontrol.currentPage = 0;
        [_pgcontrol sizeToFit];
        _pgcontrol.center = pgconcenter_;
        [self.view addSubview:_pgcontrol];
        
//        _button = [UIButton buttonWithType:UIButtonTypeCustom];
//        [_button addTarget:self action:@selector(ButtonPushed:) forControlEvents:UIControlEventTouchDown];
//        [_button setTitleColor:[UIColor colorWithWhite:0.4 alpha:1] forState:UIControlStateNormal];
//        [_button setTitle:nextText forState:UIControlStateNormal];
//        [_button setBackgroundImage:fill forState:UIControlStateHighlighted];
//        _button.clipsToBounds = true;
//        _button.frame = btnrect_;
//        _button.center = btncenter_;
//        _button.layer.cornerRadius = 4;
//        _button.layer.borderWidth = 0.5f;
//        _button.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1].CGColor;
//        
//        [self.view addSubview:_button];
        
        int index_ = 0;
        for (UIImage*image_ in images) {
            NSAssert([image_ isKindOfClass:[UIImage class]],@".views are not only UIImage.");
            CGRect ivrect_ = CGRectMake(_scrollview.bounds.size.width * index_,
                                        0,
                                        _scrollview.bounds.size.width,
                                        _scrollview.bounds.size.height);
            UIImageView*iv_ = [[UIImageView alloc] initWithFrame:ivrect_];
            iv_.contentMode = UIViewContentModeScaleAspectFill;
            iv_.clipsToBounds = true;
            iv_.image = image_;
            [_scrollview addSubview:iv_];
            index_++;
        }
    }
    return self;


}

-(void)showslide
{
    UIImage*i1 = [UIImage imageNamed:@"101"];
    UIImage*i2 = [UIImage imageNamed:@"102"];
    UIImage*i3 = [UIImage imageNamed:@"103"];
    UIImage*i4 = [UIImage imageNamed:@"104"];
    UIImage*i5 = [UIImage imageNamed:@"105"];
    UIImage*i6 = [UIImage imageNamed:@"106"];
    UIImage*i7 = [UIImage imageNamed:@"107"];
    UIImage*i8 = [UIImage imageNamed:@"108"];
    UIImage*i9 = [UIImage imageNamed:@"109"];
    
    NSArray * images =@[i1,i2,i3,i4,i5,i2,i6,i7,i8,i9];
    
    _images = images;
    
    _backgroundimageview = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_backgroundimageview];
    
    self.scrview.pagingEnabled = true;
    self.scrview.bounces = false;
    self.scrview.delegate = self;
    
    
    /**
     *  positions
     */
    CGRect svrect_ = CGRectZero;
    svrect_.size.height = self.view.bounds.size.height/3*2;
    svrect_.size.width = self.view.bounds.size.width;
    
    CGPoint svcenter_ = CGPointZero;
    svcenter_.x = self.view.center.x;
    svcenter_.y = self.view.center.y-50;
    
    CGSize svconsize = CGSizeZero;
    svconsize.height = svrect_.size.height;
    svconsize.width = svrect_.size.width * images.count;
    
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

    int index_ = 0;
    for (UIImage*image_ in images)
    {
        NSAssert([image_ isKindOfClass:[UIImage class]],@".views are not only UIImage.");
        CGRect ivrect_ = CGRectMake(self.scrview.bounds.size.width * index_,
                                    0,
                                    self.scrview.bounds.size.width,
                                    self.scrview.bounds.size.height);
        UIImageView*iv_ = [[UIImageView alloc] initWithFrame:ivrect_];
        iv_.contentMode = UIViewContentModeScaleAspectFill;
        iv_.clipsToBounds = true;
        iv_.image = image_;
        [self.scrview addSubview:iv_];
        index_++;
    }

}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    int page_ = (int)round(scrollView.contentOffset.x / scrollView.frame.size.width);
    if (page_==_images.count-1) {
        [_button setTitle:startText forState:UIControlStateNormal];
    }else{
        [_button setTitle:nextText forState:UIControlStateNormal];
    }
    _pgcontrol.currentPage = page_;
}

UIImage *(^createImageFromUIColor)(UIColor *) = ^(UIColor *color)
{
    CGRect rect = CGRectMake(0, 0, 1, 1);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, [color CGColor]);
    CGContextFillRect(contextRef, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return img;
};

-(void)setPhotoSlide
{
   
        // we have 10 images here.
        // we will add all images into a scrollView &amp; set the appropriate size.
    self.scrview.pagingEnabled = YES;
    self.scrview.showsHorizontalScrollIndicator = NO;
    self.scrview.bounces = false;
    self.scrview.delegate = self;
    
    UIImage*i1 = [UIImage imageNamed:@"1"];
    UIImage*i2 = [UIImage imageNamed:@"2"];
    UIImage*i3 = [UIImage imageNamed:@"3"];
    UIImage*i4 = [UIImage imageNamed:@"4"];
    UIImage*i5 = [UIImage imageNamed:@"5"];
    UIImage*i6 = [UIImage imageNamed:@"6"];
    UIImage*i7 = [UIImage imageNamed:@"7"];
    UIImage*i8 = [UIImage imageNamed:@"8"];
    UIImage*i9 = [UIImage imageNamed:@"109"];
    
    NSArray * images =@[i1,i2,i3,i4,i5,i2,i6,i7,i8,i9];
    
    _images = images;
    
    /**
     *  positions
     */
    CGRect svrect_ = CGRectZero;
    svrect_.size.height = self.view.bounds.size.height/3*2;
    svrect_.size.width = self.view.bounds.size.width;
    
    CGPoint svcenter_ = CGPointZero;
    svcenter_.x = self.view.center.x;
    svcenter_.y = self.view.center.y-50;
    
    CGSize svconsize = CGSizeZero;
    svconsize.height = svrect_.size.height;
    svconsize.width = svrect_.size.width * images.count;
    
    CGPoint pgconcenter_ = CGPointZero;
    pgconcenter_.x = self.view.center.x;
    pgconcenter_.y = svcenter_.y + (svrect_.size.height/2) + 20;
//
//    CGRect btnrect_ = CGRectZero;
//    btnrect_.size.width = 250;
//    btnrect_.size.height = 50;
    
    svcenter_.x = 20;
    svcenter_.y = 150;
    
    _pgcontrol = [[UIPageControl alloc] initWithFrame:CGRectZero];
    
    _pgcontrol.pageIndicatorTintColor = [UIColor colorWithWhite:0.8 alpha:1];
    _pgcontrol.currentPageIndicatorTintColor = [UIColor colorWithWhite:0.6 alpha:1];
    _pgcontrol.numberOfPages = _images.count;
    _pgcontrol.currentPage = 0;
    [_pgcontrol sizeToFit];
    
   // pgconcenter_.x = 20;
    pgconcenter_.y = 120;
    
    _pgcontrol.center = pgconcenter_;

    [self.view addSubview:_pgcontrol];
    
        for (int i=1; i <=[_images count]; i++)
        {
            // create image
            UIImage *image = [UIImage imageNamed:[NSString stringWithFormat:@"%d.png",i]];
            // create imageView
            UIImageView *imgV = [[UIImageView alloc] initWithFrame:CGRectMake((i-1)*self.scrview.frame.size.width, 0, self.scrview.frame.size.width, self.scrview.frame.size.height)];
            // set scale to fill
            imgV.contentMode=UIViewContentModeScaleToFill;
            // set image
            [imgV setImage:image];
            // apply tag to access in future
            imgV.tag=i+1;
            // add to scrollView
            [self.scrview addSubview:imgV];
        }
        // set the content size to 10 image width
        [self.scrview setContentSize:CGSizeMake(self.scrview.frame.size.width*10, self.scrview.frame.size.height)];
        // enable timer after each 2 seconds for scrolling.
//        [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollingTimer) userInfo:nil repeats:YES];
    
}


@end
