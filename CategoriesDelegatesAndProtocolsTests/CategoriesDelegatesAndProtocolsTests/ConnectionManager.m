//
//  ConnectionManager.m
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "ConnectionManager.h"

@implementation ConnectionManager

@synthesize delegate;
@synthesize running = _running;

-(void)performConnection: (NSString *)connectionName{
    NSLog(@"Connection performed!");
    
    [self.delegate didConnectToNetwork:connectionName];
}

-(void)setRunning:(BOOL)running{
    //NSLog(@"");
    _running = running;
}

-(BOOL)isRunning{
    return _running;
}

-(void)startConnection{
    NSLog(@"Connection started!");
    _running = YES;
}

-(void)stopConnection{
    NSLog(@"Connection stopped!");
    _running = NO;
}

@end
