//
//  Contact.m
//  ClassAssignment6_Contacts
//
//  Created by Student17 on 4/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "Contact.h"

@implementation Contact

-(id)init{
    self = [super init];
    
    if(self){
        self.name = [[NSString alloc] init];
        self.number = [[NSString alloc] init];
        self.homeNumber = [[NSString alloc] init];
        self.workNumber=[[NSString alloc] init];
    }
    
    return self;
}

-(id)initWithName: (NSString *)name PhoneNumber: (NSString *)phoneNumber HomeNumber: (NSString *)homeNumber AndWorkNumber: (NSString*)workNumber{
    self = [self init];
    
    if (self) {
        self.name = name;
        self.number = phoneNumber;
        self.homeNumber = homeNumber;
        self.workNumber = workNumber;
    }
    
    return self;
}

@end
