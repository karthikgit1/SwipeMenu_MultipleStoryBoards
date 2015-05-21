//
//  ComplexViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/19/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "ComplexViewController.h"
#import "ImgSlideTableViewCell.h"
#import "ContentTableViewCell.h"
#import "GTScrollNavigationBar.h"
@interface ComplexViewController ()

@end

@implementation ComplexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.tv1 registerClass:[ImgSlideTableViewCell class] forCellReuseIdentifier:cellID];
    
    self.navigationController.navigationBarHidden = true;
    
    self.menuContainerViewController.panMode = MFSideMenuPanModeNone;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 7)
    {
        self.tv1.contentInset = UIEdgeInsetsMake(-21, 0, 0, 0);
    }
    
    self.tv1.bounces = false;
   
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Tableview Delegates and DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 24;
}

static NSString *cellID = @"ImgSlideTableViewCell";

static NSString *CellIdentifier = @"ContentTableViewCell";


-(UITableViewCell *) tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    if (indexPath.row == 0)
    {
        ImgSlideTableViewCell *cell;
         cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell == nil)
        {
            cell = [[ImgSlideTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        return cell;
    }
   
    else
    {
        ContentTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        
        if (cell == nil)
        {
            cell = [[ContentTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        }
        
        cell.lbltext.text = [NSString stringWithFormat:@"row %ld",(long)indexPath.row];
        
        return cell;

    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"indexpath.row is %ld",indexPath.row);
    
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 200;
    }
    return 50;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0)
    {
        return 200;
    }
    return 50;
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)activeScrollView
{
    
    CGFloat currentPostion = activeScrollView.contentOffset.y;
    
  //  NSLog(@"currentPostion - _lastPosition is %f",currentPostion - _lastPosition);
    
   // NSLog(@"_lastPosition - currentPostion is %f",_lastPosition - currentPostion);
    
    if (currentPostion - _lastPosition > 15 )
    {
        //NSLog(@"ScrollUp now");
        _lastPosition = currentPostion;
        
       // btnouter.hidden = true;
        
        
        
    }
    else if (_lastPosition - currentPostion > 15)
    {
        //NSLog(@"ScrollDown now");
        _lastPosition = currentPostion;
        
       // btnouter.hidden = false;
        
        
    }
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //    NSLog(@"0=====Scroll-->%f",scrollView.contentOffset.y);
    
    CGFloat currentPostion = scrollView.contentOffset.y;
    // NSLog(@"currentPostion - _lastPosition is %f",currentPostion - _lastPosition);
    if (currentPostion - _lastPosition > 55 )
    {
        //NSLog(@"ScrollUp now");
        _lastPosition = currentPostion;
        
        
        //self.navigationController.navigationBarHidden = true;
        
        self.vw1.hidden = false;
        
        self.btnl1.hidden = true;
        self.btnr1.hidden = true;
        
        if (isAnimating)
        {
            return;
        }
        if (hidden)
        {
            // [self hideView];
            
          // self.navigationController.navigationBarHidden = true;
        }
        
    }
    else if (_lastPosition - currentPostion > 55)
    {
        //NSLog(@"ScrollDown now");
        _lastPosition = currentPostion;
        
        //self.navigationController.navigationBarHidden = false;
        
        self.vw1.hidden = true;
        
        self.btnl1.hidden = false;
        self.btnr1.hidden = false;

        
        if (isAnimating)
        {
            return;
        }
        if (scrollView.contentOffset.y < 0 && !hidden)
        {
            // [self showView];
           // self.navigationController.navigationBarHidden = false;
        }
        
    }
    
}


- (IBAction)l1action:(id)sender
{
    NSLog(@"l1 is pressed");
}


- (IBAction)r1Action:(id)sender
{
    NSLog(@"r2 is pressed");
}

- (IBAction)leftAction:(id)sender
{
    NSLog(@"Left action is pressed");
}

- (IBAction)rightAction:(id)sender
{
    NSLog(@"Right action is pressed");
}

- (BOOL)shouldAutorotate
{
    return YES;
}

//- (NSUInteger)supportedInterfaceOrientations
//{
//    if (isLandscapeOK) {
//        // for iPhone, you could also return UIInterfaceOrientationMaskAllButUpsideDown
//        return UIInterfaceOrientationMaskAll;
//    }
//    return UIInterfaceOrientationMaskPortrait;
//}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
