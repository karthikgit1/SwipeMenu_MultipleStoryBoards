//
//  PopupView.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/13/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "PopupView.h"

@implementation PopupView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)awakeFromNib {
    //Note that you must change @”BNYSharedView’ with whatever your nib is named
    [[NSBundle mainBundle] loadNibNamed:@"SampleView" owner:self options:nil];
    //[self addSubview: self.contentView];
}

- (IBAction)btnDone:(id)sender
{
    [self.delegate buttonWasPressed];
}


@end
