//
//  DatePickerViewController.m
//  ClassAssignment10_UserInterfaceInspector
//
//  Created by Student17 on 4/27/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;

@end

@implementation DatePickerViewController
- (IBAction)datePicker:(id)sender {
    
    UIDatePicker *date = (UIDatePicker*)sender;
    
    self.labelDate.text = [NSString stringWithFormat:@"%@", date.date];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UISegmentedControl appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                    [UIFont fontWithName:@"Chalkduster" size:26.0], NSFontAttributeName,
                                                    [UIColor greenColor], NSForegroundColorAttributeName,
                                                    nil]
                                          forState:UIControlStateNormal];
    self.datePicker.datePickerMode = UIDatePickerModeDate;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 4;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return 2;
}
@end
