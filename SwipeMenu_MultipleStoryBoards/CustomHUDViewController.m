//
//  CustomHUDViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/19/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "CustomHUDViewController.h"
#import "SVProgressHUD.h"
@interface CustomHUDViewController ()
{
    dispatch_queue_t imageQueue ;
}
@end

@implementation CustomHUDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    imageQueue = dispatch_queue_create("com.company.app.imageQueue", NULL);
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
- (IBAction)showHud:(id)sender
{
    
   [SVProgressHUD showWithStatus:@"Doing Stuff" maskType:SVProgressHUDMaskTypeAnimation];
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    dispatch_async(imageQueue, ^{
        [NSThread sleepForTimeInterval:4];
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [SVProgressHUD dismiss];
            
        });
    });

}
- (IBAction)btn2Action:(id)sender
{
    NSLog(@"btn is pressed");
}

@end
