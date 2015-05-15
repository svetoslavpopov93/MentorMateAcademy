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
    
    
    UIBarButtonItem *registerButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(userDidClickOnRegisterButton)];
    
    registerButton.title = @"Sign up";
    
    self.navigationItem.rightBarButtonItem = registerButton;
    appDelegate = [[UIApplication sharedApplication] delegate];
    
    NSLog(@"");
}

-(void)viewDidDisappear:(BOOL)animated{
    
    self.fetchedResultsController = nil;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)userDidClickOnRegisterButton{
    UICollectionViewController *registerVC = [self.storyboard instantiateViewControllerWithIdentifier:@"registerVC"];
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:registerVC];
    
    [self.navigationController presentViewController:navController animated:YES completion:nil];
}

- (IBAction)userDidClickOnLoginButton:(id)sender {
    if ([self allInputFieldsDidPassValidation]) {
      
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        NSManagedObject *failedBankInfo = [NSEntityDescription
                                           insertNewObjectForEntityForName:@"User"
                                           inManagedObjectContext:context];
        NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
        NSEntityDescription *entity = [NSEntityDescription
                                       entityForName:@"User" inManagedObjectContext:context];
        [fetchRequest setEntity:entity];
        NSError *error = [[NSError alloc] init];
        //fetchRequest.predicate = [NSPredicate predicateWithFormat:@"nickName = %@", self.textFieldUsername.text];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"nickName == %@", self.textFieldUsername.text];
        [fetchRequest setPredicate:predicate];
        NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
        
        for (User *item in fetchedObjects) {
            NSLog([NSString stringWithFormat:@"%@ %@ %@", item.firstName, item.lastName, item.nickName]);
        }
        
        
        
        
        UIViewController *allApartmentsVC = [self.storyboard instantiateViewControllerWithIdentifier:@"allApartmentsVC"];
        
        [self.navigationController pushViewController:allApartmentsVC animated:YES];
    }
    else{
        UIAlertView *invalidInputAlert = [[UIAlertView alloc] initWithTitle:@"Invalid input!" message:@"No empty fields allowed!" delegate:self cancelButtonTitle:@"Return" otherButtonTitles: nil];
        
        [invalidInputAlert show];
    }
}

//-(NSFetchedResultsController *)fetchedResultsController{
//    
//    if (_fetchedResultsController != nil) {
//        return _fetchedResultsController;
//    }
//    
//    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
//    NSEntityDescription *entity = [NSEntityDescription
//                                   entityForName:@"User" inManagedObjectContext:appDelegate.managedObjectContext];
//    [fetchRequest setEntity:entity];
//    NSSortDescriptor *sort = [[NSSortDescriptor alloc]
//                              initWithKey:@"nickName" ascending:NO];
//    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
//    
//    [fetchRequest setFetchBatchSize:20];
//    
//    NSFetchedResultsController *theFetchedResultsController =
//    [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
//                                        managedObjectContext:appDelegate.managedObjectContext sectionNameKeyPath:nil
//                                                   cacheName:nil];
//    self.fetchedResultsController = theFetchedResultsController;
//    _fetchedResultsController.delegate = self;
//    
//    return _fetchedResultsController;
//}

- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"User"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sort = [[NSSortDescriptor alloc] initWithKey:@"nickName" ascending:NO];
    [fetchRequest setSortDescriptors:[NSArray arrayWithObject:sort]];
    
    [fetchRequest setFetchBatchSize:20];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest managedObjectContext:context
                                                                      sectionNameKeyPath:nil
                                                                               cacheName:nil];
    
    _fetchedResultsController.delegate = self;
    return _fetchedResultsController;
}

#pragma mark Input fields validation

-(BOOL)allInputFieldsDidPassValidation{
    if ([self inputDidPassValidationCheck:self.textFieldUsername.text]
        && [self inputDidPassValidationCheck:self.textFieldPassword.text]) {
        
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
