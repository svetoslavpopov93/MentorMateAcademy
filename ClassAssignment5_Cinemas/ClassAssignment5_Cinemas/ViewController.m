#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *buttonSignIn;
@property (weak, nonatomic) IBOutlet UIButton *buttonSignUp;


@end

@implementation ViewController{
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    DataModelSingleton *model = [DataModelSingleton sharedDataModel];
    [model didFillExampleUsers];
    
    NSLog(@"");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)buttonActionDirectionChooser:(id)sender {
    if([(UIButton*)sender isEqual:self.buttonSignIn]){
        UIViewController *loginViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
        [self.navigationController pushViewController: loginViewController animated: YES];
    }
    else{
        UIViewController *registerViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"RegisterViewController"];
        [self.navigationController pushViewController:registerViewController animated:YES];
    }
    
    
}

-(void)didFillExampleData{
    
}

@end
