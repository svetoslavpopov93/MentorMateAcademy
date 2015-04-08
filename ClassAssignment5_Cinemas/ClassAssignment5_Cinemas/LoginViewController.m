//
//  LoginViewController.m
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/7/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textfieldUsername;
@property (weak, nonatomic) IBOutlet UITextField *textfieldPassword;

@end

@implementation LoginViewController{
    DataModelSingleton *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [DataModelSingleton sharedDataModel];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)buttonActionLogin:(id)sender {
    if([model didPerformUserCheckWithUsername:self.textfieldUsername.text andPassword:self.textfieldPassword.text]){
        UIViewController *cinemaListViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CinemaListViewController"];
        
        [self.navigationController pushViewController:cinemaListViewController animated:YES];
    }
}

@end
