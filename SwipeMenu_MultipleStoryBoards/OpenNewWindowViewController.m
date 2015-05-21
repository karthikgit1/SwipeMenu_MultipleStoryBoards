//
//  OpenNewWindowViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/17/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "OpenNewWindowViewController.h"

@interface OpenNewWindowViewController ()

@end

@implementation OpenNewWindowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
- (IBAction)showWindow:(id)sender
{
   // [InformationWindow openWindow];
    
//    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Window" bundle:nil];
//    ProductDetailsViewController * _pd = [storyBoard instantiateViewControllerWithIdentifier:@"ProductDetailsViewController"];
    
    InformationWindow *_win = [[InformationWindow alloc] init];
    _win.delegate = self;
    [InformationWindow openWindow];
}

- (void)buttonWasPressed
{
    // Put code here for button's intended action.
    
    NSLog(@"Btn is pressed");
}

@end
