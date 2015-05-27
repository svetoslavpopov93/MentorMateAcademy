//
//  FeedsTableViewController.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/26/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "FeedsTableViewController.h"

@interface FeedsTableViewController ()
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation FeedsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [[DataManager sharedDataManager] setDelegate:self];
    [[DataManager sharedDataManager] fetchFlickrFeed];
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void)refresh{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    long count = [[[DataManager sharedDataManager] entries] count];
    
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FlickrTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"flickrCell" forIndexPath:indexPath];
    
    NSArray * currentEntry = [[DataManager sharedDataManager] entries];
    NSMutableDictionary *currentElement =[currentEntry objectAtIndex:indexPath.row];
    NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[currentElement objectForKey:@"mainImage"]]];
    cell.imageView.image = [UIImage imageWithData:imageData];
    return cell;
}

#pragma mark DataManagerDelegate

-(void)dataDidFinishFetching{
    
    
    [self.tableView reloadData];
}

@end
