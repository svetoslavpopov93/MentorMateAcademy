//
//  AllNewsTableViewController.m
//  ClassAssignment7_News
//
//  Created by Student17 on 4/15/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "AllNewsTableViewController.h"

@interface AllNewsTableViewController ()

@end

@implementation AllNewsTableViewController{
    DataManagerSingleton *dataManager;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataManager = [DataManagerSingleton initSharedDataManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    int count = (int)dataManager.news.count;
    return count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"allNewsCell"];
    
    News *newNews =dataManager.news[indexPath.row];
    cell.textLabel.text = newNews.title;
    
    return cell;
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

@end
