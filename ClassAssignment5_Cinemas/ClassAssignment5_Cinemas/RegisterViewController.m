#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *textFieldUserName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPassword;

@end

@implementation RegisterViewController{
    DataModelSingleton *model;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    model = [DataModelSingleton sharedDataModel];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)buttonRegister:(id)sender {
    [model didRegisterUserWithUserName:self.textFieldUserName.text AndPassword:self.textFieldPassword.text];
    
    UIViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self.navigationController pushViewController: loginViewController animated: YES];
}

@end