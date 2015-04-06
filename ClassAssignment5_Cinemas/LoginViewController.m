//
//  LoginViewController.m
//  ClassAssignment5_Cinemas
//
//  Created by Student17 on 4/6/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController () <UIAlertViewDelegate>

@end

@implementation LoginViewController
{
    NSString *testUsername;
    NSString *testPassword;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    testUsername = [[NSString alloc] init];
    testPassword = [[NSString alloc] init];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)ButtonLoginAction:(id)sender {
    if ([testUsername isEqualToString:testPassword]) {
        UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Welcome!"
                                                         message:@"Login successfull!"
                                                        delegate:self
                                               cancelButtonTitle:@"OK"
                                               otherButtonTitles: nil];
        
        [alert show];
    }
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    if (buttonIndex == 0) {
        
        UIViewController *cinemaViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CinemaViewController"];
        [self.navigationController pushViewController: cinemaViewController animated:YES];
    }
}

@end
