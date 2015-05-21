//
//  ViewController.m
//  SwipeMenu_MultipleStoryBoards
//
//  Created by Vy Systems - iOS1 on 2/5/15.
//  Copyright (c) 2015 Vy Systems - iOS1. All rights reserved.
//

#import "ViewController.h"
#import "ORGContainerCell.h"
#import "ORGContainerCellView.h"

#import "DetailViewController.h"

#import "TableViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.sampleData = @[ @{ @"description": @"Section A",
                            @"articles": @[ @{ @"title": @"Article A1" },
                                            @{ @"title": @"Article A2" },
                                            @{ @"title": @"Article A3" },
                                            @{ @"title": @"Article A4" },
                                            @{ @"title": @"Article A5" }
                                            ]
                            },
                         @{ @"description": @"Section B",
                            @"articles": @[ @{ @"title": @"Article B1" },
                                            @{ @"title": @"Article B2" },
                                            @{ @"title": @"Article B3" },
                                            @{ @"title": @"Article B4" },
                                            @{ @"title": @"Article B5" }
                                            ]
                            },
                         ];
    
    // Register the table cell
    [self.tableView registerClass:[ORGContainerCell class] forCellReuseIdentifier:@"ORGContainerCell"];
    
    // Add observer that will allow the nested collection cell to trigger the view controller select row at index path
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didSelectItemFromCollectionView:) name:@"didSelectItemFromCollectionView" object:nil];

    self.menuContainerViewController.panMode = MFSideMenuPanModeDefault;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"didSelectItemFromCollectionView" object:nil];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.sampleData count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

static NSString *cellID = @"TableViewCell";

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 1)
    {
        ORGContainerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ORGContainerCell"];
        NSDictionary *cellData = [self.sampleData objectAtIndex:[indexPath section]];
        NSArray *articleData = [cellData objectForKey:@"articles"];
        [cell setCollectionData:articleData];
        return cell;
    }
   else
    {
        TableViewCell *cell1 = [tableView dequeueReusableCellWithIdentifier:cellID];
        
        if (cell1 == nil)
        {
            cell1 = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        cell1.lbl1.text = [NSString stringWithFormat:@"row%d",indexPath.row];
        return cell1;
    }

    
    
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // This code is commented out in order to allow users to click on the collection view cells.
    //    if (!self.detailViewController) {
    //        self.detailViewController = [[ORGDetailViewController alloc] initWithNibName:@"ORGDetailViewController" bundle:nil];
    //    }
    //    NSDate *object = _objects[indexPath.row];
    //    self.detailViewController.detailItem = object;
    //    [self.navigationController pushViewController:self.detailViewController animated:YES];
}

#pragma mark UITableViewDelegate methods

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    NSDictionary *sectionData = [self.sampleData objectAtIndex:section];
    NSString *header = [sectionData objectForKey:@"description"];
    return header;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return 180;
    }
    else
    {
        return 80.0;
        
    }
    
}

#pragma mark - NSNotification to select table cell

- (void) didSelectItemFromCollectionView:(NSNotification *)notification
{
    NSDictionary *cellData = [notification object];
    
    NSLog(@"data is %@",cellData);
    if (cellData)
    {
        
        UIStoryboard * storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        DetailViewController * _pd = [storyBoard instantiateViewControllerWithIdentifier:@"DetailViewController"];
        
        //_pd.detailItem = cellData;
        
        [self.navigationController pushViewController:_pd animated:YES];
    }
}


@end
