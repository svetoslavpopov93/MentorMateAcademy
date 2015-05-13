//
//  AddEventViewController.m
//  ClassAssignment13_TODOList
//
//  Created by Student17 on 5/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "AddEventViewController.h"

@interface AddEventViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldEventTitle;
@property (nonatomic, strong) AppDelegate *delegate;

@end

@implementation AddEventViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.delegate = [[UIApplication sharedApplication] delegate];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(saveEvent)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector(backToPreviousVC)];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)saveEvent{
    
    Event *event = [NSEntityDescription insertNewObjectForEntityForName:@"Event" inManagedObjectContext:self.delegate.managedObjectContext];
    [event setValue:self.textFieldEventTitle.text forKey:@"title"];
    [event setValue:@NO forKey:@"isMarked"];
    
    NSError *error;
    if (![self.delegate.managedObjectContext save: &error]) {
        NSLog(@"Event saving failed!");
    }
    else{
        NSLog(@"Event saved!");
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)backToPreviousVC{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
