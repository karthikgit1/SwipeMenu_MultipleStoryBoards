//
//  BubbleChatViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/7/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "BubbleChatViewController.h"
#import "MessageStyleManager.h"
#import "JDFNavigationBarActivityIndicator.h"

@interface BubbleChatViewController ()
{
    dispatch_queue_t imageQueue ;
}
@property (nonatomic, strong) JDFNavigationBarActivityIndicator *activityIndicator;


@end

@implementation BubbleChatViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
  imageQueue = dispatch_queue_create("com.company.app.imageQueue", NULL);
    
    self.navigationItem.title = @"JDFActivityIndicator";
    
    JDFNavigationBarActivityIndicator *activityIndicator = [[JDFNavigationBarActivityIndicator alloc] init];
    activityIndicator.color = [UIColor colorWithRed:52.0f/255.0f green:152.0f/255.0f blue:219.0f/255.0f alpha:1.0f];
    [activityIndicator addToNavigationBar:self.navigationController.navigationBar startAnimating:NO];
    self.activityIndicator = activityIndicator;
    
    self.menuContainerViewController.panMode = MFSideMenuPanModeDefault;
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
- (IBAction)btnToggle:(id)sender
{
//    if (self.activityIndicator.animating) {
//        [self.activityIndicator stopAnimating];
//    } else {
//        [self.activityIndicator startAnimating];
//    }
    
    [self.activityIndicator startAnimating];
    
    dispatch_async(imageQueue, ^{
        [NSThread sleepForTimeInterval:4];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            [self.activityIndicator stopAnimating];
                   });
    });

}

@end
