//
//  NsOp.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/18/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "NsOp.h"

@implementation NsOp
{
    NSMutableArray *array;
}

- (void)main
{
    if ([self isCancelled])
    {
        NSLog(@"** operation cancelled **");
    }
    
    // Do some work here
    NSLog(@"Working... working....");
    
    if ([self isCancelled])
    {
        NSLog(@"** operation cancelled **");
    }
    // Do any clean-up work here...
    
    // If you need to update some UI when the operation is complete, do this:
    [self performSelectorOnMainThread:@selector(loadData) withObject:nil waitUntilDone:NO];
    
    NSLog(@"Operation finished");
}

- (void) loadData
{
    
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
    
    for(NSString *str in tmp_array)
    {
        [array addObject:str];
    }
    
//    [self.tableView performSelectorOnMainThread:@selector(reloadData) withObject:nil waitUntilDone:YES];
}

@end
