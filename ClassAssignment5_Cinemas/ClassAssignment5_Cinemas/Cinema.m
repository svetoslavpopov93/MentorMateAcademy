//
//  Cinema.m
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/8/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "Cinema.h"

@implementation Cinema

-(id)init{
    self= [super init];
    
    if (self) {
        self.name = [[NSString alloc] init];
        self.workTime = [[NSString alloc] init];
        self.moviesList = [[NSMutableArray alloc] init];
    }
    
   
    return self;
}

-(id)initWithName: (NSString*)name AndWorkTime: (NSString*)workTime{
    self = [self init];
    
    if(self){
        self.name = name;
        self.workTime = workTime;
    }
    
    return self;
}

-(void)willAddNewMovie: (Movie*)movie{
    [self.moviesList addObject:movie];
}

@end
