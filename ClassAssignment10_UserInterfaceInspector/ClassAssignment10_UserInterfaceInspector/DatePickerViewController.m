//
//  DatePickerViewController.m
//  ClassAssignment10_UserInterfaceInspector
//
//  Created by Student17 on 4/27/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()

@end

@implementation DatePickerViewController
- (IBAction)datePicker:(id)sender {
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                    [UIFont fontWithName:@"Chalkduster" size:26.0], NSFontAttributeName,
                                                    [UIColor greenColor], NSForegroundColorAttributeName,
                                                    nil]
                                          forState:UIControlStateNormal];
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

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 5;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}
@end
