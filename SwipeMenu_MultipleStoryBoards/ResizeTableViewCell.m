//
//  ResizeTableViewCell.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/12/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "ResizeTableViewCell.h"
#import "UIViewExt.h"

#define FONT_SIZE 14.0f
#define CELL_CONTENT_WIDTH 320.0f
#define CELL_CONTENT_MARGIN 10.0f

@implementation ResizeTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

-(void)layoutSubviews
{
    
    CGFloat height = [self heightContentBackgroundView:self.label.text];
    
       float screen_Height;
    float screen_Width;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]  >= 8)
    {
        screen_Height = [[UIScreen mainScreen] bounds].size.height;
        screen_Width = [[UIScreen mainScreen] bounds].size.width;
    }
    else
    {
        screen_Height = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width);
        screen_Width = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height);
    }
    
    NSLog(@"height is %f",height);

    self.label.frame=CGRectMake(0, 5, screen_Width, 200);
        if(self.myImageView.image)
        {
           self.myImageView.frame=CGRectMake(5, self.label.bottom, 100, 100);
        }
    
    
    /*
    self.myImageView.frame=CGRectMake(5, 5, 100, 100);
    CGFloat height = [self heightContentBackgroundView:self.label.text];
    
    float screen_Height;
    float screen_Width;
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue]  >= 8)
    {
        screen_Height = [[UIScreen mainScreen] bounds].size.height;
        screen_Width = [[UIScreen mainScreen] bounds].size.width;
    }
    else
    {
        screen_Height = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width);
        screen_Width = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height);
    }

    NSLog(@"screen width is %f",screen_Width);
    
    self.label.frame=CGRectMake(110, 15, screen_Width -120 , height);
    
    */
}

- (CGFloat)heightContentBackgroundView:(NSString *)content
{
    CGFloat height = [self heigtOfLabelForFromString:content fontSizeandLabelWidth:290 andFontSize:16.0];
    if (height<30)
    {
        height = 30;
    }
    height += 20;
    
    return height;
}

- (CGFloat)heigtOfLabelForFromString:(NSString *)text fontSizeandLabelWidth:(CGFloat)width andFontSize:(CGFloat)fontSize
{
    
    //    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, 20000)];
    //    return size.height;
    
    //  NSString *text = [dataArray objectAtIndex:[indexPath row]];
    
    CGSize constraint = CGSizeMake(CELL_CONTENT_WIDTH , 20000.0f);
    
    NSAttributedString *attributedText =
    [[NSAttributedString alloc]
     initWithString:text
     attributes:@
     {
     NSFontAttributeName:[UIFont systemFontOfSize:FONT_SIZE]
     }];
    
    CGRect rect = [attributedText boundingRectWithSize:constraint
                                               options:NSStringDrawingUsesLineFragmentOrigin
                                               context:nil];
    CGSize size = rect.size;
    
    
    CGFloat height = MAX(size.height, 30.0f);
    
    //NSLog(@"heigtOfLabelForFromString is %f",size.height + 10);
    return height + 10;
    //return height + (CELL_CONTENT_MARGIN * 2);
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
   // NSLog(@"reuseIdentifier is %@",reuseIdentifier);
    if (self)
    {
        // Initialization code
        // CGFloat height = [self heightContentBackgroundView:commentModel.content];
        
        float screen_Height;
        float screen_Width;
        
        if ([[[UIDevice currentDevice] systemVersion] floatValue]  >= 8)
        {
            screen_Height = [[UIScreen mainScreen] bounds].size.height;
            screen_Width = [[UIScreen mainScreen] bounds].size.width;
        }
        else
        {
            screen_Height = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width);
            screen_Width = ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height);
        }
        
        NSLog(@"screen width is %f",screen_Width);
        
       // CGFloat height = [self heightContentBackgroundView:self.label.text];
        
        self.label=[[UILabel alloc]initWithFrame:CGRectMake(0, 3, screen_Width, 200)];
        self.label.numberOfLines=0;
        self.label.lineBreakMode=NSLineBreakByCharWrapping;
        
        self.label.backgroundColor=[UIColor clearColor];
        [self addSubview:self.label];
        
        self.myImageView=[[UIImageView alloc]initWithFrame:CGRectZero];
       // [self addSubview:self.myImageView];
    }
    return self;
}


@end
