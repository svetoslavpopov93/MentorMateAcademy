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
    self.labelEventDate.text = [NSString stringWithFormat:@"%@", dataModel.selectedEvent.eventDate];
    self.imageViewEventCover.image = dataModel.selectedEvent.eventCover;
    self.textViewEventInfo.text = dataModel.selectedEvent.eventInfo;
    
//    NSDictionary *elementsDict = NSDictionaryOfVariableBindings(_labelEventDate, _labelRelatedPerson, _labelEventDate, _imageViewEventCover, _textViewEventInfo, _viewInnerView);
//    [NSLayoutConstraint constraintsWithVisualFormat:@"|-(==20)-[imageViewEventCover(==50)]-(==20)-|" options: NSLayoutFormatAlignAllCenterX metrics:nil views:@{@"imageViewEventCover":self.imageViewEventCover}];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_imageViewEventCover]-|" options:NSLayoutFormatDirectionLeadingToTrailing metrics:nil views:elementsDict]];
//    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"|-[_imageViewEventCover(>=100)]-|" options:NSLayoutAttributeRightMargin metrics:nil views:elementsDict]];
    
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
