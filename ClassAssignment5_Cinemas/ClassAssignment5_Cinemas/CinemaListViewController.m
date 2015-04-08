//
//  CinemaListViewController.m
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/7/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "CinemaListViewController.h"

@interface CinemaListViewController ()

@property (weak, nonatomic) IBOutlet UIButton *buttonFirstDetail;
@property (weak, nonatomic) IBOutlet UIButton *buttonSecondDetail;
@property (weak, nonatomic) IBOutlet UIButton *buttonThirdDetail;
@property (weak, nonatomic) IBOutlet UILabel *labelFirstMovie;
@property (weak, nonatomic) IBOutlet UILabel *labelSecondMovie;
@property (weak, nonatomic) IBOutlet UILabel *labelThirdMovie;

@end

@implementation CinemaListViewController{
    DataModelSingleton *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [DataModelSingleton sharedDataModel];
    
    Cinema *first = [model.cinemas objectAtIndex:0];;
    self.labelFirstMovie.text =first.name;
    
    Cinema *second = [model.cinemas objectAtIndex:1];
    self.labelSecondMovie.text = second.name;

    Cinema *third = [model.cinemas objectAtIndex:2];
    self.labelThirdMovie.text = third.name;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)buttonActionDetails:(id)sender {
    if ([(UIButton*)sender isEqual: self.buttonFirstDetail]) {
        model.cinemaIndex = 0;
    }
    else if([(UIButton*)sender isEqual: self.buttonSecondDetail]){
        model.cinemaIndex = 1;
    }
    else{
        model.cinemaIndex = 2;
    }
}

@end
