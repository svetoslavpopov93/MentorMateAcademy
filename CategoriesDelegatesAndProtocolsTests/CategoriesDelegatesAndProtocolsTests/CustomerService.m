//
//  CustomerService.m
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "CustomerService.h"

@implementation CustomerService

@synthesize delegate;

-(void)saveCustomer:(NSString *)name{
    // save the customer
    NSLog(@"save customer method was called.");
    [self.delegate didSaveCustomer:name];
}
@end
