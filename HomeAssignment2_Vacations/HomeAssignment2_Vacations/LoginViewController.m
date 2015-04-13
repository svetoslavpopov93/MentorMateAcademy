//
//  LoginViewController.m
//  HomeAssignment2_Vacations
//
//  Created by Student17 on 4/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonMonastry;
@property (weak, nonatomic) IBOutlet UIButton *buttonVila;
@property (weak, nonatomic) IBOutlet UIButton *buttonHotel;

@end

@implementation LoginViewController{
    DataModelSingleton *dataModel;
    NSMutableSet *testVacations;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataModel = [DataModelSingleton sharedDataModel];

    [self generateRandomVacations];
    
    Vacation *hotelVacation = [[Vacation alloc]
                               initWithVacationType:Hotel
                               Name:[NSString stringWithFormat:@"Hotel1"]
                               Info:@"iuohfnil aiul al iar iluruli nsnur lsuin nuisl ns nului siur nlsiun lsnruisglnnr uisrnglusnrgnslui"
                               Location:@"Burgas"
                               OpenDays:[[NSMutableArray alloc]
                                         initWithObjects:@"Monday",@"Tuesday", @"Wednesday", @"Thursday", @"Friday", nil]
                               AndPrice:200];
    [dataModel bookVacation:hotelVacation];
    
    NSLog(@"");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (IBAction)buttonActionChoseVacation:(id)sender {
    if ((UIButton*)sender == self.buttonMonastry) {
        long len = dataModel.monastryVacations.count;
        Vacation *current = [[Vacation alloc] init];
                             current = dataModel.monastryVacations[len-1];
        dataModel.selectedVacation = current;
        NSLog(@"");
    }
    
    UIViewController *detailsViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"detailsViewController"];
    
    
    [self.navigationController pushViewController:detailsViewController animated:YES];
}

-(void)generateRandomVacations{
    for (int i = 0; i < 10; i++) {
        [dataModel generateVacation];
    }
}

@end
