//
//  User.m
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/7/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "User.h"

@implementation User

-(id)init{
    self = [super init];
    
    if(self){
        self.username = [[NSString alloc] init];
        self.password = [[NSString alloc] init];
    }
    
    return self;
}

@end
