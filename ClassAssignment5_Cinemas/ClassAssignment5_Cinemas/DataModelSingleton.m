//
//  DataModelSingleton.m
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/7/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "DataModelSingleton.h"

static DataModelSingleton *myDataModel = nil;

@implementation DataModelSingleton{
    
}

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
        self.cinemas = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(BOOL)didPerformUserCheckWithUsername: (NSString *)username andPassword: (NSString *)password{
    
    if ([self.users objectForKey: username] != nil) {
        return YES;
    }
    
    return NO;
}

-(void)didFillExampleUsers{
    self.users[@"ivan"] = @"ivan";
    self.users[@"kiro"] = @"kiro";
    
    Cinema *arena = [[Cinema alloc] initWithName:@"Arena" AndWorkTime:@"09:30-23:30"];
    [arena.moviesList addObject:[[Movie alloc] initWithName:@"Wolf of Wallstreet" Length:2.5 AndPrice:12]];
    [arena.moviesList addObject:[[Movie alloc] initWithName:@"Terminator" Length:2.3 AndPrice:10]];
    [arena.moviesList addObject:[[Movie alloc] initWithName:@"Fast And Furious 7" Length:2 AndPrice:15]];
    
    Cinema *imax = [[Cinema alloc] initWithName:@"IMax" AndWorkTime:@"09:00-23:00"];
    [imax.moviesList addObject:[[Movie alloc] initWithName:@"Despicable Me 3" Length:2.1 AndPrice:13]];
    [imax.moviesList addObject:[[Movie alloc] initWithName:@"Frozen" Length:1.5 AndPrice:10]];
    [imax.moviesList addObject:[[Movie alloc] initWithName:@"American Sniper" Length:3 AndPrice:15]];
    
    Cinema *cinemax = [[Cinema alloc] initWithName:@"Cinemax" AndWorkTime:@"10:30-01:30"];
    [cinemax.moviesList addObject:[[Movie alloc] initWithName:@"Wolf of Wallstreet" Length:2.5 AndPrice:12]];
    [cinemax.moviesList addObject:[[Movie alloc] initWithName:@"Terminator" Length:2.3 AndPrice:15]];
    [cinemax.moviesList addObject:[[Movie alloc] initWithName:@"Fast And Furious 7" Length:2 AndPrice:11]];
    
    [self.cinemas addObject:arena];
    [self.cinemas addObject:imax];
    [self.cinemas addObject:cinemax];
}

-(void)didRegisterUserWithUserName: (NSString*)username AndPassword: (NSString* )password{
    
    self.users[[NSString stringWithFormat: @"%@", username]] = [NSString stringWithFormat: @"%@", password];
    
}

-(id)didGetUsersDictionary{
    return self.users;
}

@end
