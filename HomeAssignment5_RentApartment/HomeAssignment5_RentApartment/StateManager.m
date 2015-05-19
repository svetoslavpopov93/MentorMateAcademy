//
//  StateManager.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/15/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "StateManager.h"
static StateManager *sharedManager;

@implementation StateManager
@synthesize currentUser;

+(id)sharedStateManager{
    
    @synchronized(self){
        if (sharedManager == nil) {
            sharedManager = [[self alloc] init];
        }
        
        return sharedManager;
    }
}

-(id)init{
    self = [super init];
    
    return self;
}

@end
