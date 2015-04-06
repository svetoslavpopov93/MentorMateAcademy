//
//  CinemaViewController.m
//  ClassAssignment5_Cinemas
//
//  Created by Student17 on 4/6/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "CinemaViewController.h"

@interface CinemaViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonCinemaOne;
@property (weak, nonatomic) IBOutlet UIButton *buttonCinemaTwo;

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (IBAction)userDidChoseCinema:(id)sender {
    if ([self.buttonCinemaOne isEqual:sender]) {
        NSLog(@"First");
    }
    else if ([self.buttonCinemaTwo isEqual:sender]) {
        NSLog(@"First");
    }
}


@end
