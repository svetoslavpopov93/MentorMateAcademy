//
//  LoginViewController.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/14/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textFieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end

@implementation LoginViewController{
    AppDelegate *appDelegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(userDidClickOnRegisterButton)];
    
    self.navigationItem.rightBarButtonItem = registerButton;
    self.textFieldUsername.delegate = self;
    self.textFieldPassword.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewDidDisappear:(BOOL)animated{
    self.textFieldUsername.text = @"";
    self.textFieldPassword.text = @"";
}

#pragma mark Navigation actions

-(void)userDidClickOnRegisterButton{
    
    UICollectionViewController *registerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"registerVC"];
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:registerVC];
    [self.navigationController presentViewController:navController animated:YES completion:nil];
    
}

- (IBAction)userDidClickOnLoginButton:(id)sender {
    if ([self allInputFieldsDidPassValidation]) {
        NSArray *fetchedUsers = [self performFetchRequestForUserName:self.textFieldUsername.text];
        
        if (fetchedUsers.count > 0) {
            StateManager *stateManager = [StateManager sharedStateManager];
            stateManager.currentUser = fetchedUsers[0];
            
            UIViewController *allApartmentsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"allApartmentsVC"];
            [self.navigationController pushViewController:allApartmentsVC animated:YES];
        }
        else{
            UIAlertView *invalidPasswordAV = [[UIAlertView alloc] initWithTitle:@"Invalid password!" message:@"Please make sure that username and password are correct!" delegate:self cancelButtonTitle:@"Try again" otherButtonTitles:nil];
            
            [invalidPasswordAV show];
        }
    }
    else{
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Invalid input!" message:@"Please make sure that the input is correct!" delegate:self cancelButtonTitle:@"Try again" otherButtonTitles:nil];
        
        [alert show];
    }
}

#pragma mark Input management 

// Dismisses the keyboard when user hits the "Return" key
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

//Checks if the data of all text fields is valid and it is not an empty string
-(BOOL)allInputFieldsDidPassValidation{
    if ([self inputDidPassValidationCheckString:self.textFieldUsername.text]
        && [self inputDidPassValidationCheckString:self.textFieldPassword.text]) {
        
        return YES;
    }
    
    else {
        return NO;
    }
}

// Check if the string is empty or only with white spaces
-(BOOL)inputDidPassValidationCheckString: (NSString*)inputString{
    NSString *trimmed = [inputString stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ([trimmed isEqualToString:@""]) {
        return NO;
    }
    else{
        return YES;
    }
}

#pragma mark CodeData interactions

// Fetches all users with username and password equal to the entered
-(NSArray*)performFetchRequestForUserName: (NSString *)username{
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"User" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nickName == %@ AND password == %@", self.textFieldUsername.text, self.textFieldPassword.text];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = [[NSError alloc] init];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if(fetchedObjects.count > 1){
        NSLog(@"Warning! More than one user with this username exists in the database!");
    }
    
    return fetchedObjects;
}

@end
