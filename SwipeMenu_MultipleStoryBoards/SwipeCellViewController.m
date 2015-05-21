//
//  SwipeCellViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/13/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "SwipeCellViewController.h"
#import "SwipeableCell.h"
@interface SwipeCellViewController ()
@property (nonatomic, strong) UISwipeGestureRecognizer *leftSwipeGestureRecognizer;
@end

@implementation SwipeCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.menuContainerViewController setMenuState:MFSideMenuStateClosed completion:^{}];
    
    self.leftSwipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(handleSwipes:)];
    self.leftSwipeGestureRecognizer.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:self.leftSwipeGestureRecognizer];
    
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;

}

- (void)handleSwipes:(UISwipeGestureRecognizer *)sender
{
    if (sender.direction == UISwipeGestureRecognizerDirectionLeft)
    {
        NSLog(@"left swipe");
    }
    
    
    if (sender.direction == UISwipeGestureRecognizerDirectionRight)
    {
        
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated
{
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self.navigationController.sideMenu setMenuState:MFSideMenuStateLeftMenuOpen];
//    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Tableview Delegate and Datasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SwipeableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SwipeableCell" forIndexPath:indexPath];
    
    NSString *item = [NSString stringWithFormat:@"item %d",indexPath.row];
    cell.itemText = item;
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
   [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}
@end
