//
//  EventDetailsViewController.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/27/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "EventDetailsViewController.h"

@interface EventDetailsViewController ()

@property (weak, nonatomic) IBOutlet UILabel *labelEventTitle;
@property (weak, nonatomic) IBOutlet UILabel *labelRelatedPerson;
@property (weak, nonatomic) IBOutlet UILabel *labelEventDate;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewEventCover;
@property (weak, nonatomic) IBOutlet UITextView *textViewEventInfo;
@property (weak, nonatomic) IBOutlet UIView *viewInnerView;

@end

@implementation EventDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataModelSingleton *dataModel = [DataModelSingleton initSharedDataModel];
    
    self.labelEventTitle.text = dataModel.selectedEvent.eventLabel;
    self.labelRelatedPerson.text = dataModel.selectedEvent.relatedPerson;
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"dd/MM/yyyy";
    NSString *dateString = [mmddccyy stringFromDate:dataModel.selectedEvent.eventDate];
    
    self.labelEventDate.text = dateString;
    self.imageViewEventCover.image = dataModel.selectedEvent.eventCover;
    self.textViewEventInfo.text = dataModel.selectedEvent.eventInfo;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
