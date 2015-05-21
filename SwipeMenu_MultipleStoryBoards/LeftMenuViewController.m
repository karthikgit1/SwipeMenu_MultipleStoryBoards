//
//  LeftMenuViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/5/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "LeftMenuViewController.h"

@interface LeftMenuViewController ()
{
    NSMutableArray *tableViewArray;
}

@end

@implementation LeftMenuViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    tableViewArray = [NSMutableArray arrayWithObjects:@"About Dr. Jay",@"Dr. Jay's Services",@"Navigation Bar Activity Indicator",@"Dynamic Cell Size",@"Swipable Cell",@"Slide View",@"New Window",@"NsOperation",@"App Designs",@"Slide Photo",@"Custom HUD",@"Growing Text View",@"Custom Alert",@"Semi Transparent", nil];
    
    // This will remove extra separators from tableview
    self.tv1.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - tableview datasource and delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection: (NSInteger)section
{
    return  [tableViewArray count];
}

static  NSString *CellIdentifier = @"Cell";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell  = [tableView
                                                                          dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell  == nil)
    {
        cell  = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleSubtitle
                 reuseIdentifier:CellIdentifier];
    }
    cell.backgroundColor = [UIColor redColor];
    // Configure the cell.
    UIImage *cellImage = [UIImage imageNamed:@"apple.png"];
    cell.imageView.image = cellImage;
    
    cell.detailTextLabel.text = [tableViewArray objectAtIndex:indexPath.row];
    
    UITableViewCellAccessoryDetailDisclosureButton;
    cell.accessoryType = UITableViewCellAccessoryCheckmark;
    
    
    return  cell;
}

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell  = [tableView
                              dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell  == nil)
    {
        cell  = [[UITableViewCell alloc]
                 initWithStyle:UITableViewCellStyleSubtitle
                 reuseIdentifier:CellIdentifier];
    }
    
    cell.detailTextLabel.textColor = [UIColor whiteColor];
    
    return indexPath;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath: (NSIndexPath *)indexPath
{
//    NSString *message = [NSString stringWithFormat:@"You selected %@",
//                         [tableViewArray objectAtIndex:indexPath.row]];
//    
//    UIAlertView *alert  = [[UIAlertView alloc]  initWithTitle:@"Alert" message: message
//                                                     delegate:self cancelButtonTitle:@"Close" otherButtonTitles:nil];
//    
//    [alert  show];
    
    
    UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    UIStoryboard * storyBoard1 = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    
     UIStoryboard * storyBoard2 = [UIStoryboard storyboardWithName:@"DynamicCellResize" bundle:nil];
    
    UIStoryboard * storyBoard4 = [UIStoryboard storyboardWithName:@"SwipableCell" bundle:nil];
    
    UIViewController *demoViewController;
    UINavigationController *navigationController;
    NSArray *controllers;
    
    NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
    NSLog(@"selectedIndexPath.row is %d",selectedIndexPath.row );
    
    switch (indexPath.row)
    {
        case 0:
            demoViewController = [storyBoard instantiateViewControllerWithIdentifier:@"ViewController"];
            
            //bbbb
            // demoViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"OrderDetailsViewController"];
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
        case 1:
            
            demoViewController = [storyBoard1 instantiateViewControllerWithIdentifier:@"OtherViewController"];
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
        case 2:
            
            demoViewController = [storyBoard1 instantiateViewControllerWithIdentifier:@"BubbleChatViewController"];
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
        case 3:
            
            demoViewController = [storyBoard2 instantiateViewControllerWithIdentifier:@"DynamicCellSizeViewController"];
            
           // demoViewController = [storyBoard2 instantiateViewControllerWithIdentifier:@"RJTableViewController"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
        case 4:
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
        case 5:
            
            storyBoard4 = [UIStoryboard storyboardWithName:@"SlideView" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SlideViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
            //OpenNewWindowViewController
        case 6:
            
            storyBoard4 = [UIStoryboard storyboardWithName:@"Window" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"OpenNewWindowViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;

            
        case 7:
            
            storyBoard4 = [UIStoryboard storyboardWithName:@"NsOperation" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"NsOperationExampleViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
            
        case 8:
            
            storyBoard4 = [UIStoryboard storyboardWithName:@"AppDesigns" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"ComplexViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
            
            
        case 9:
            
            storyBoard4 = [UIStoryboard storyboardWithName:@"SlidePhoto" bundle:nil];
            
          //  demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"PhotoSlideViewController"];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"NewViewController"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;

            
        case 10:
            
            storyBoard4 = [UIStoryboard storyboardWithName:@"SlidePhoto" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"CustomHUDViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;

        case 11:
            
            storyBoard4 = [UIStoryboard storyboardWithName:@"GrowingTextView" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"GrowingTextViewViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
        case 12:
            //CustomAlertViewViewController
            storyBoard4 = [UIStoryboard storyboardWithName:@"CustomAlertView" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"CustomAlertViewViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;
            
        case 13:
            //CustomAlertViewViewController
            storyBoard4 = [UIStoryboard storyboardWithName:@"CustomAlertView" bundle:nil];
            
            demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SemiTransparentViewController"];
            
            //demoViewController = [storyBoard4 instantiateViewControllerWithIdentifier:@"SwipeCellViewController1"];
            
            navigationController = self.menuContainerViewController.centerViewController;
            controllers = [NSArray arrayWithObject:demoViewController];
            navigationController.viewControllers = controllers;
            [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
            
            break;

    }
    
}

@end
