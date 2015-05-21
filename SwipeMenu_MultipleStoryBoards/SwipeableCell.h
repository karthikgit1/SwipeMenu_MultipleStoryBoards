//
//  SwipeableCell.h
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/13/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SwipeableCellDelegate <NSObject>
- (void)buttonOneActionForItemText:(NSString *)itemText;
- (void)buttonTwoActionForItemText:(NSString *)itemText;
- (void)cellDidOpen:(UITableViewCell *)cell;
- (void)cellDidClose:(UITableViewCell *)cell;
@end


@interface SwipeableCell : UITableViewCell

@property (nonatomic, strong) NSString *itemText;
@property (nonatomic, weak) id <SwipeableCellDelegate> delegate;
- (void)openCell;

@end

