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
@property (weak, nonatomic) IBOutlet UITextField *labelTFHours;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@end

@implementation AddNewEventViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    dataModel = [DataModelSingleton initSharedDataModel];
    
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc]
                                   initWithTitle:@"Done"
                                   style:UIBarButtonItemStyleDone
                                   target:self
                                   action:@selector(doneButtonPressed)];
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)doneButtonPressed{
    if( [self validateInputStrings] ){
     
        NSString* hours = self.labelTFHours.text;
    
        [dataModel addEvent:[[Event alloc] initWithEventLabel:self.textFieldEventTitle.text relatedPerson:self.textFieldRelatedPerson.text hours:hours.floatValue eventInfo:self.textFieldEventInfo.text eventDate:self.datePicker.date] forDate: self.datePicker.date];
    
        UIViewController *allEventsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"allEventsVC"];
        [self.navigationController pushViewController:allEventsVC animated:YES];
    
        [self saveData];
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid input!"
                                                        message:@"Please make sure that all fields are fill!" delegate:self cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
        [alert show];
    }
}

- (void) saveData {
    NSMutableDictionary *dataDict = [[NSMutableDictionary alloc] init];
    DataModelSingleton *dataManager = [DataModelSingleton initSharedDataModel];
    
    if (dataManager.events != nil) {
        [dataDict setObject:dataManager.days forKey:@"days"];
    }
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectoryPath = [paths objectAtIndex:0];
    NSString *filePath = [documentsDirectoryPath stringByAppendingPathComponent:@"appData"];
    
    [NSKeyedArchiver archiveRootObject:dataDict toFile:filePath];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return NO;
}

-(BOOL)validateInputStrings {
    
//    NSString *trimmedString = [string stringByTrimmingCharactersInSet:
//                               [NSCharacterSet whitespaceCharacterSet]];
    
    if ( [[self.textFieldEventTitle.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString: @""] ) {
        return NO;
    }
    else if( [[self.textFieldRelatedPerson.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString: @""] ){
        return NO;
    }
    else if( [[self.textFieldHours.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString: @""] ){
        return NO;
    }
    else if( [[self.textFieldEventInfo.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] isEqualToString: @""] ){
        return NO;
    }
    else{
        return YES;
    }
}

@end
