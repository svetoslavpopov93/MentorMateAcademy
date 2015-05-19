//
//  AddNewOfferViewController.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/15/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "AddNewOfferViewController.h"

@interface AddNewOfferViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageViewImage;
@property (weak, nonatomic) IBOutlet UITextField *textFieldTitle;
@property (weak, nonatomic) IBOutlet UITextField *textFieldApartmentType;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCityQuarter;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDetails;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPrice;

@end

@implementation AddNewOfferViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel target:self action:@selector (userDidClickCancelButton)];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(userDidClickDoneButton)];
    
    self.navigationItem.leftBarButtonItem = cancelButton;
    self.navigationItem.rightBarButtonItem = doneButton;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark NavigationBar actions

-(void)userDidClickCancelButton{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)userDidClickDoneButton{
    if ([self allInputFieldsDidPassValidation]) {
        AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
        
        // Configuring the saving request from the input values
        NSManagedObjectContext *context = appDelegate.managedObjectContext;
        Apartment *newApartment = [NSEntityDescription insertNewObjectForEntityForName:@"Apartment" inManagedObjectContext:context];
        [newApartment setValue:self.textFieldApartmentType.text forKey:@"apartmentType"];
        [newApartment setValue:self.textFieldCity.text forKey:@"city"];
        [newApartment setValue:self.textFieldCityQuarter.text forKey:@"cityQuarter"];
        [newApartment setValue:self.textFieldDetails.text forKey:@"details"];
        [newApartment setValue:UIImagePNGRepresentation(self.imageViewImage.image) forKey:@"image"];
        [newApartment setValue:[NSNumber numberWithFloat:[self.textFieldPrice.text floatValue]] forKey:@"price"];
        [newApartment setValue:[[StateManager sharedStateManager] currentUser] forKey:@"owner"];
        [newApartment setValue:self.textFieldTitle.text forKey:@"title"];
        
        //        // After the context saving the returned data is checked and if the saving fails an alert is shown.
        //        // If the saving is successfull, the application is returned to the login screen
        NSError *error;
        if (![context save:&error]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to save apartment!" message:@"Please make sure that the input is correct!" delegate:self cancelButtonTitle:@"Try again" otherButtonTitles:nil];
            [alert show];
            NSLog(@"Saving apartment failed!");
        }
        else{
             UIAlertView *successAlertView = [[UIAlertView alloc] initWithTitle:@"Apartment added!" message:nil delegate:self cancelButtonTitle:@"Continue" otherButtonTitles: nil];
            
            [successAlertView show];
                        
            [self dismissViewControllerAnimated:YES completion:nil];
        }

    }
    else{
        UIAlertView *invalidInputAlert = [[UIAlertView alloc] initWithTitle:@"Invalid input!" message:@"No empty fields allowed!" delegate:self cancelButtonTitle:@"Return" otherButtonTitles: nil];
        
        [invalidInputAlert show];
    }
}

#pragma mark Input management

//Checks if the data of all text fields is valid and it is not an empty string
-(BOOL)allInputFieldsDidPassValidation{
    if ( [self inputDidPassValidationCheckForEmptyString:self.textFieldTitle.text]
        && [self inputDidPassValidationCheckForEmptyString:self.textFieldApartmentType.text]
        && [self inputDidPassValidationCheckForEmptyString:self.textFieldCity.text]
        && [self inputDidPassValidationCheckForEmptyString:self.textFieldCityQuarter.text]
        && [self inputDidPassValidationCheckForEmptyString:self.textFieldDetails.text]
        && [self inputDidPassValidationCheckForEmptyStringAndIfNumber:self.textFieldPrice.text] ) {
        
        return YES;
    }
    
    else {
        return NO;
    }
}

// Check if the string is empty or only with white spaces
-(BOOL)inputDidPassValidationCheckForEmptyString: (NSString*)inputString{
    NSString *trimmed = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([trimmed isEqualToString:@""]) {
        return NO;
    }
    else{
        return YES;
    }
}

// Check if the input string is number, empty string or if he contains only white spaces
-(BOOL)inputDidPassValidationCheckForEmptyStringAndIfNumber: (NSString*)inputString{
    NSString *trimmed = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    BOOL trimmedInputIsNumber =[[NSScanner scannerWithString:trimmed] scanFloat:nil];
    
    if ([trimmed isEqualToString:@""]) {
        return NO;
    }
    else if(!trimmedInputIsNumber){
        return NO;
    }
    else{
        return YES;
    }
}
@end
