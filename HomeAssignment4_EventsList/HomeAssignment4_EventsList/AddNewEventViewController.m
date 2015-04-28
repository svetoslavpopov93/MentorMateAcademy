//
//  AddNewEventViewController.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/28/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "AddNewEventViewController.h"

@interface AddNewEventViewController (){
    DataModelSingleton *dataModel;
}

@property (weak, nonatomic) IBOutlet UITextField *textFieldEventTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRelatedPerson;
@property (weak, nonatomic) IBOutlet UITextField *textFieldHours;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEventInfo;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation AddNewEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataModel = [DataModelSingleton initSharedDataModel];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)buttonActionCreate:(id)sender {
    [dataModel addEvent:[[Event alloc] initWithEventLabel:self.textFieldEventTitle.text relatedPerson:self.textFieldRelatedPerson.text hours:[self.textFieldHours.text floatValue] eventInfo:self.textFieldEventInfo.text eventDate:self.datePicker.date] forDate: self.datePicker.date];
    
    UIViewController *allEventsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"allEventsVC"];
    [self.navigationController pushViewController:allEventsVC animated:YES];
}

@end
