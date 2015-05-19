//
//  ViewController.m
//  ClassAssignment14_Notifications
//
//  Created by Student17 on 5/18/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *eventText;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated{
    [self.tableView reloadData];
}

-(void)viewDidAppear:(BOOL)animated{
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark TableView methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[[UIApplication sharedApplication] scheduledLocalNotifications] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *cellIdentifier = @"Cell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    NSArray *notifications = [[UIApplication sharedApplication] scheduledLocalNotifications];
    UILocalNotification *currentNotification = [notifications objectAtIndex:indexPath.row];
    
    [cell.textLabel setText:currentNotification.alertBody];
    [cell.detailTextLabel setText:[currentNotification.fireDate description]];
    
    return cell;
}

#pragma mark Button actions

- (IBAction)scheduleAlarm:(id)sender {
    [self.eventText resignFirstResponder];

    UILocalNotification *notification = [[UILocalNotification alloc] init];
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:25];
    
    notification.alertBody = self.eventText.text;
    notification.alertTitle = self.eventText.text;
    notification.timeZone = [NSTimeZone defaultTimeZone];
    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];    NSArray *arr = [[UIApplication sharedApplication] scheduledLocalNotifications];
    NSLog([NSString stringWithFormat:@"%lu", (unsigned long)[[[UIApplication sharedApplication] scheduledLocalNotifications] count]]);
    [self.tableView reloadData];
}

@end
