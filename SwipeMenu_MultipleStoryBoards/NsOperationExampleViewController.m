//
//  NsOperationExampleViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/18/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "NsOperationExampleViewController.h"
#import "AOperation.h"
#import "BOperation.h"

@interface NsOperationExampleViewController ()
{
    NSMutableArray *array;
    
    NSOperationQueue* parseQueue;
}
@end

@implementation NsOperationExampleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Load"
                                                                              style:UIBarButtonItemStyleDone
                                                                             target:self
                                                                             action:@selector(loadData)];
    
   array = [[NSMutableArray alloc] initWithCapacity:10000];
    
    parseQueue = [NSOperationQueue new];
    
    AOperation* aOperation = [AOperation new];
    BOperation* bOperation = [BOperation new];
    
    [bOperation addDependency:aOperation];
    [parseQueue addOperation:aOperation];
    [parseQueue addOperation:bOperation];
}

- (void)didReceiveMemoryWarning
{
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

- (void) loadData {
    
    /* Operation Queue init (autorelease) */
    NSOperationQueue *queue = [NSOperationQueue new];
    
    /* Create our NSInvocationOperation to call loadDataWithOperation, passing in nil */
    NSInvocationOperation *operation = [[NSInvocationOperation alloc] initWithTarget:self
                                                                            selector:@selector(loadDataWithOperation)
                                                                              object:nil];
    
    /* Add the operation to the queue */
    [queue addOperation:operation];
}

- (void) loadDataWithOperation {
    NSURL *dataURL = [NSURL URLWithString:@"http://icodeblog.com/samples/nsoperation/data.plist"];
    
    NSArray *tmp_array = [NSArray arrayWithContentsOfURL:dataURL];
    
    for(NSString *str in tmp_array) {
        [array addObject:str];
    }
    
    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [array count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.textLabel setText:[array objectAtIndex:indexPath.row]];
    
    return cell;
}


@end
