//
//  ViewController.m
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end


@implementation ViewController
@synthesize delegate;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CustomerService *cust = [[CustomerService alloc] init];
    
    cust.delegate = self;
    
    [cust saveCustomer:@"Ivan"];
    
    ConnectionManager *con = [[ConnectionManager alloc] init];
    con.running = YES;
    //NSLog( [NSString stringWithFormat:@"%@", con.running] );
    
    [con startConnection];
    [con stopConnection];
    
    NSMutableString *connectionName = @"TestConnection";
    
    con.connectionName = connectionName;
    
    connectionName = @"TestConnection - Modified!";
    
    //[self didSaveCustomer:@""];
}

-(void)didSaveCustomer:(NSString *)name{
    NSLog( [NSString stringWithFormat: @"Customer %@ was saved!", name] );
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)buttonActionClick:(id)sender {
    
    SecondViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"vc"];
    
    vc.message = @"Hi, im button!";
    
    [self.navigationController pushViewController:vc animated:YES];
}

@end
