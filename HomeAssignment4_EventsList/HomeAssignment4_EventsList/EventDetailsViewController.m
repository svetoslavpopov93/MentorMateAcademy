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

@end

@implementation EventDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DataModelSingleton *dataModel = [DataModelSingleton initSharedDataModel];
    
    self.labelEventTitle.text = dataModel.selectedEvent.eventLabel;
    self.labelRelatedPerson.text = dataModel.selectedEvent.relatedPerson;
    self.labelEventDate.text = [NSString stringWithFormat:@"%@", dataModel.selectedEvent.eventDate];
    self.imageViewEventCover.image = dataModel.selectedEvent.eventCover;
    self.textViewEventInfo.text = dataModel.selectedEvent.eventInfo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
