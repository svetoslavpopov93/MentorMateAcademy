//
//  EditNewsTableViewController.m
//  ClassAssignment7_News
//
//  Created by Student17 on 4/15/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "EditNewsTableViewController.h"

@interface EditNewsTableViewController (){
    DataManagerSingleton *dataManager;
}

@end

@implementation EditNewsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = NO;
    
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    dataManager = [DataManagerSingleton initSharedDataManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataManager.news.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"editNewsCell"];
    
    News *newNews = dataManager.news[indexPath.row];
    cell.textLabel.text = newNews.title;
    
    return cell;
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row % 2 == 0) {
        return UITableViewCellEditingStyleDelete;
    }
    else{
        return UITableViewCellEditingStyleInsert;
    }
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:
(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [dataManager.news removeObjectAtIndex: indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
        
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        News *newNews = [DataManagerSingleton generateSingleNews];
        
        [dataManager.news addObject: newNews];
        [tableView insertRowsAtIndexPaths:@[indexPath]
                         withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:
(NSIndexPath *)toIndexPath{
    News *newNews = dataManager.news[toIndexPath.row];
    dataManager.news[toIndexPath.row] = dataManager.news[fromIndexPath.row];
    dataManager.news[fromIndexPath.row] = newNews;
}

@end
