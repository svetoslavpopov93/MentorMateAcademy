//
//  FeaturedNewsTableViewController.m
//  ClassAssignment7_News
//
//  Created by Student17 on 4/15/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "FeaturedNewsTableViewController.h"

@interface FeaturedNewsTableViewController ()

@end

@implementation FeaturedNewsTableViewController{
    DataManagerSingleton *dataModel;
    NSMutableArray *featuredNews;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataModel = [DataManagerSingleton initSharedDataManager];
    featuredNews = [[NSMutableArray alloc] init];
                    
    for (int i = 0; i < dataModel.news.count; i++) {
        News *newNews =dataModel.news[i];
        
        if (newNews.isFeatured) {
            [featuredNews addObject:newNews];
        }
    }
    
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
    
    return featuredNews.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"featuredNewsCell" forIndexPath:indexPath];
    
    News *newNews =featuredNews[indexPath.row];
    cell.textLabel.text = newNews.title;
    
    return cell;
}



-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}


@end
