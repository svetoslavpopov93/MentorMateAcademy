//
//  ContactViewController.m
//  ClassAssignment6_Contacts
//
//  Created by Student17 on 4/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ContactViewController.h"

@interface ContactViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UILabel *labelNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelHomeNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelWorkNumber;

@end

@implementation ContactViewController{
    ModelSingleton *model;
    Contact *currentContact;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [ModelSingleton dataModel];
    currentContact = [model.contacts objectAtIndex:model.index];
    
    self.labelName = currentContact.name;
    self.labelNumber = currentContact.number;
    self.labelHomeNumber = currentContact.homeNumber;
    self.labelWorkNumber = currentContact.workNumber;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
@end
