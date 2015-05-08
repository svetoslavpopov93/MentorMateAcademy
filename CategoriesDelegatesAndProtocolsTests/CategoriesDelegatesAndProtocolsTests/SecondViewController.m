//
//  SecondViewController.m
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labelOutput;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.labelOutput.text = self.message;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)didConnectToNetwork:(NSString *)connectionName{
    self.labelOutput.text = connectionName;
}
@end
