//
//  AOperation.m
//  NSOperation
//
//  Created by Jue Wang on 10/17/12.
//  Copyright (c) 2012 Jue Wang. All rights reserved.
//

#import "AOperation.h"
@interface AOperation()
{
    BOOL finished;
}

@end

@implementation AOperation
@synthesize isFinished;
-(void)start
{
    self.isFinished = NO;
    
    NSLog(@"AOperation");
    
    [NSThread sleepForTimeInterval:5];
    self.isFinished = YES;
}


@end
