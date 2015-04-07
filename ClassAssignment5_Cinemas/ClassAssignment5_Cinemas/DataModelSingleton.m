//
//  DataModelSingleton.m
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/7/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "DataModelSingleton.h"

static DataModelSingleton *myDataModel = nil;

@implementation DataModelSingleton

@synthesize users;

+(id)sharedDataModel{
    @synchronized(self){
        if (myDataModel == nil) {
            myDataModel = [[self alloc] init];
        }
        
        return myDataModel;
    }
}

-(id)init{
    self = [super init];
    
    if(self){
        self.users = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

+(BOOL)didPerformUserCheckWithUsername:(NSString *)username andPassword:(NSString *)password{
    
    
    /// TODO: Fix return value
    return true;
    
}

-(void)didFillExampleUsers{
    self.users[@"ivan"] = @"ivan";
    self.users[@"kiro"] = @"kiro";
}

-(void)didRegisterUserWithUserName: (NSString*)username AndPassword: (NSString* )password{
    
    self.users[[NSString stringWithFormat: @"%@", username]] = [NSString stringWithFormat: @"%@", password];
    
}

@end
