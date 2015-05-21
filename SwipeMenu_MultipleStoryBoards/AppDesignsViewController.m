//
//  AppDesignsViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/18/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "AppDesignsViewController.h"

@interface AppDesignsViewController ()

@end

@implementation AppDesignsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = true;
    
    //self.imgv1.layer.cornerRadius = 25;

    self.imgv1.layer.cornerRadius = self.imgv1.frame.size.height /2;
    self.imgv1.layer.masksToBounds = YES;
    self.imgv1.layer.borderWidth = 3.0f;
    self.imgv1.layer.borderColor = [UIColor redColor].CGColor;
    
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


@end
