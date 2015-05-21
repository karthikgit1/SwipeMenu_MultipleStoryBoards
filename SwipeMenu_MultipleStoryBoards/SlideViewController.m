//
//  SlideViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/13/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "SlideViewController.h"

@interface SlideViewController ()
{
    UIView *customView;
    
    
}

@end

@implementation SlideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.menuContainerViewController.panMode = MFSideMenuPanModeDefault;
    
    customView = [[[NSBundle mainBundle] loadNibNamed:@"Test" owner:self options:nil] objectAtIndex:0];
    
    PopupView *pop = [[PopupView alloc] init];
    
    pop.delegate = self;
    
    [self setModalPresentationStyle:UIModalPresentationCurrentContext];

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
- (IBAction)btnAction:(id)sender
{
    SlidingViewOptions options = ShowDoneButton|ShowCancelButton|CancelOnBackgroundPressed|AvoidKeyboard;
    void (^cancelOrDoneBlock)() = ^{
        // we must manually slide out the view out if we specify this block
        [MFSlidingView slideOut];
    };
    
    [MFSlidingView slideView:customView intoView:self.view
            onScreenPosition:BottomOfScreen
           offScreenPosition:BelowScreen title:@"Avoid Keyboard"
                     options:options
                   doneBlock:cancelOrDoneBlock
                 cancelBlock:cancelOrDoneBlock];
}


- (IBAction)showRandomView:(id)sender
{
 // CustomView *customView1 = [CustomView customView];
    
    //customView1.delegate = self;
    
   UIView  *paintView=[[UIView alloc]initWithFrame:CGRectMake(0, 50, 320, 200)];
    [paintView setBackgroundColor:[UIColor yellowColor]];
    
//    CGRect buttonFrame = CGRectMake( 10, 80, 100, 30 );
//    
//    // Create a label and add it to the view.
//    CGRect labelFrame = CGRectMake( 10, 40, 100, 30 );
//    UILabel* label = [[UILabel alloc] initWithFrame: labelFrame];
//    [label setText: @"My Label"];
//    [label setTextColor: [UIColor orangeColor]];
//    [self.view addSubview: label];
//    
//    UIButton *button = [[UIButton alloc] initWithFrame: buttonFrame];
//    [button setTitle: @"My Button" forState: UIControlStateNormal];
//    [button setTitleColor: [UIColor redColor] forState: UIControlStateNormal];
//    
//    [button addTarget: self
//               action: @selector(buttonClicked:)
//     forControlEvents: UIControlEventTouchDown];
//    
//    [paintView addSubview: button];
  
    
   [MFSlidingView slideView:paintView intoView:self.view
            onScreenPosition:MiddleOfScreen offScreenPosition:LeftOfScreen];
}

- (void) buttonClicked: (id)sender
{
    NSLog( @"Button clicked." );
}

- (void)buttonWasPressed
{
    // Put code here for button's intended action.
    
    NSLog(@"Btn is pressed");
}



@end
