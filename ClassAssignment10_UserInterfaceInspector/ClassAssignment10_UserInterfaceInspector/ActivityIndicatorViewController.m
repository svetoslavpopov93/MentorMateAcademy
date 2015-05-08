//
//  ActivityIndicatorViewController.m
//  ClassAssignment10_UserInterfaceInspector
//
//  Created by svetoslavpopov on 5/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ActivityIndicatorViewController.h"

@interface ActivityIndicatorViewController ()
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation ActivityIndicatorViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    UIActivityIndicatorView *spinner = self.spinner;
//    
//    //[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
////    
////    [spinner setCenter:CGPointMake(self.view.frame.size.width/2.0, self.view.frame.size.height/2.0)]; // I do this because I'm in landscape mode
//    [self.view addSubview:spinner];
//    [spinner startAnimating];
    
    for (id spinner in self.view.subviews) {
        if ([spinner isKindOfClass:[UIActivityIndicatorView class]]) {
            [spinner startAnimating];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)buttonActionRotateFlowers:(id)sender {
    if (self.spinner.isAnimating) {
        for (id spinner in self.view.subviews) {
            if ([spinner isKindOfClass:[UIActivityIndicatorView class]]) {
                [spinner stopAnimating];
            }
        }
    }
    else{
        for (id spinner in self.view.subviews) {
            if ([spinner isKindOfClass:[UIActivityIndicatorView class]]) {
                [spinner startAnimating];
            }
        }
    }
}

@end
