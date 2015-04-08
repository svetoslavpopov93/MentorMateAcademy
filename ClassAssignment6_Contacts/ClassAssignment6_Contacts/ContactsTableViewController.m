//
//  ContactsTableViewController.m
//  ClassAssignment6_Contacts
//
//  Created by Student17 on 4/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ContactsTableViewController.h"

@interface ContactsTableViewController ()

@end

@implementation ContactsTableViewController{
    ModelSingleton *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [ModelSingleton dataModel];
    
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
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return model.contacts.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellIdentifier = @"ContactIdentifier";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    cell.textLabel.text = ((Contact*)model.contacts[indexPath.row]).name;
    cell.detailTextLabel.text = ((Contact *)model.contacts[indexPath.row]).number;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    model.index = indexPath.row;
    
    UIViewController *contactInfoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"contactViewController"];
    
    [self.navigationController pushViewController:contactInfoVC animated:YES];
}

-(void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    
    model.index = indexPath.row;
    
    UIViewController *contactInfoVC = [self.storyboard instantiateViewControllerWithIdentifier:@"contactViewController"];
    
    [self.navigationController pushViewController:contactInfoVC animated:YES];
}

@end
