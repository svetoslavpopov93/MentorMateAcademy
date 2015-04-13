//
//  DetailsViewController.m
//  HomeAssignment2_Vacations
//
//  Created by Student17 on 4/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DetailsViewController.h"

@interface DetailsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelType;
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelInfo;
@property (weak, nonatomic) IBOutlet UILabel *labelLocation;
@property (weak, nonatomic) IBOutlet UILabel *labelPrice;
@property (weak, nonatomic) IBOutlet UILabel *labelOpenDays;
@property (weak, nonatomic) IBOutlet UILabel *labelReviewsCount;

@end

@implementation DetailsViewController{
    DataModelSingleton *dataModel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataModel = [DataModelSingleton sharedDataModel];
    
    NSString *currentType = [[NSString alloc] init];
    if (dataModel.selectedVacation.vacationType == 0) {
        currentType = @"Monastry";
    }
    else if(dataModel.selectedVacation.vacationType == 1){
        currentType = @"Vila";
    }
    else{
        currentType = @"Hotel";
    }
    
    NSMutableString *openDays = [[NSMutableString alloc] init];
    for (int i = 0; i < dataModel.selectedVacation.openDays.count; i++) {
        [openDays appendString:[NSString stringWithFormat: @"%@, ", dataModel.selectedVacation.openDays[i]]];
    }

    self.labelType.text = currentType;
    self.labelName.text = dataModel.selectedVacation.name;
    self.labelInfo.text = dataModel.selectedVacation.info;
    self.labelLocation.text = dataModel.selectedVacation.location;
    self.labelOpenDays.text = openDays;
    self.labelPrice.text = [NSString stringWithFormat:@"$%0.2f",dataModel.selectedVacation.price];
    [self reviewVacation:dataModel.selectedVacation];
    self.labelReviewsCount.text = [NSString stringWithFormat:@"%d",dataModel.selectedVacation.reviewCount];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)goOnVacation:(Vacation *)vacation{
    
}

-(void)reviewVacation:(Vacation *)vacation{
    vacation.reviewCount += 1;
    NSLog(@"Count increased. %d", vacation.reviewCount);
}

-(bool)isVacation:(Vacation *)vacation openForDate:(NSString *)day{
    return true;
}

@end
