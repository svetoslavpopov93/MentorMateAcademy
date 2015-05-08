//
//  PickerViewController.m
//  ClassAssignment10_UserInterfaceInspector
//
//  Created by svetoslavpopov on 5/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UILabel *labelSelectedElement;

@end

@implementation PickerViewController{
    NSMutableArray *arr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.pickerView.dataSource = self;
    self.pickerView.delegate = self;
    arr = [[NSMutableArray alloc] init];
    [arr addObject:@"First"];
    [arr addObject:@"Second"];
    [arr addObject:@"Third"];
    [arr addObject:@"Fourth"];
    [arr addObject:@"Fifth"];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return arr.count;
}

-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view{
    UILabel* label = nil;
    if (view == nil) {
        view = [[UIView alloc] init];
        view.backgroundColor = [UIColor blueColor];
        label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 22)];
        label.text = [NSString stringWithFormat:arr[row]];
        label.tintColor = [UIColor orangeColor];
        label.textColor = [UIColor purpleColor];
        [view addSubview:label];
    }
    if (label == nil) {
        NSLog(@"%@",view.subviews);
        label = view.subviews[0]; // I do get subviews here.
    }
    
    view.tintColor = [UIColor greenColor];
    view.backgroundColor = [UIColor yellowColor];
    
    return view;
}


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    self.labelSelectedElement.text = [arr objectAtIndex:row];
    
}

@end
