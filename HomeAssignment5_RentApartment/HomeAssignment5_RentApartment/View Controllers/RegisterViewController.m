//
//  RegisterViewController.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/14/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textFieldFirstName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLastName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAge;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNickName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(userDidClickDoneButton)];
    
    self.navigationItem.rightBarButtonItem = doneButton;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)userDidClickDoneButton{
    if ([self allInputFieldsDidPassValidation]) {
        
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext *context = appDelegate.managedObjectContext;
        User *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
        [newUser setValue:self.textFieldFirstName.text forKey:@"firstName"];
        [newUser setValue:self.textFieldLastName.text forKey:@"lastName"];
        [newUser setValue:self.textFieldAddress.text forKey:@"address"];
        NSString *stringValue =self.textFieldAge.text;
        [newUser setValue:[NSNumber numberWithInt:stringValue.intValue] forKey:@"age"];
        [newUser setValue:self.textFieldNickName.text forKey:@"nickName"];
        [newUser setValue:self.textFieldPassword.text forKey:@"password"];
        
        NSError *error;
        if (![context save:&error]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to save!" message:@"Please make sure that the input is correct!" delegate:self cancelButtonTitle:@"Try again" otherButtonTitles:nil];
            
            [alert show];
            
            NSLog(@"Saving failed!");
        }
        else{
            UIAlertView *successAlertView = [[UIAlertView alloc] initWithTitle:@"Registration successful!" message:nil delegate:self cancelButtonTitle:@"Continue" otherButtonTitles: nil];
            
            [successAlertView show];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }
    
    else{
        UIAlertView *invalidInputAlert = [[UIAlertView alloc] initWithTitle:@"Invalid input!" message:@"No empty fields allowed!" delegate:self cancelButtonTitle:@"Return" otherButtonTitles: nil];
        
        [invalidInputAlert show];
    }
}

-(BOOL)allInputFieldsDidPassValidation{
    if ( [self inputDidPassValidationCheck:self.textFieldFirstName.text]
        && [self inputDidPassValidationCheck:self.textFieldLastName.text]
        && [self inputDidPassValidationCheck:self.textFieldNickName.text]
        && [self inputDidPassValidationCheck:self.textFieldAddress.text]
        && [self inputDidPassValidationCheck:self.textFieldAge.text]
        && [self inputDidPassValidationCheck:self.textFieldPassword.text] ) {
        
        return YES;
    }
    
    else {
        return NO;
    }
}

-(BOOL)inputDidPassValidationCheck: (NSString*)inputString{
    NSString *trimmed = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([trimmed isEqualToString:@""]) {
        return NO;
    }
    else{
        return YES;
    }
}

@end
