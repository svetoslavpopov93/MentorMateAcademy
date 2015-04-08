//
//  ModelSingleton.m
//  ClassAssignment6_Contacts
//
//  Created by Student17 on 4/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "ModelSingleton.h"
static ModelSingleton *sharedDataModel = nil;

@implementation ModelSingleton

+(id)dataModel{
    @synchronized(self){
        if (sharedDataModel == nil) {
            sharedDataModel = [[self alloc] init];
        }
        
        return sharedDataModel;
    }
}

-(id)init{
    self = [super init];
    
    if (self) {
        Contact *ivan = [[Contact alloc] initWithName:@"Ivan" PhoneNumber:@"098876555" HomeNumber:@"384503850" AndWorkNumber:@"w564e56e7"];
        Contact *kiro = [[Contact alloc] initWithName:@"Kiril" PhoneNumber:@"509685096363" HomeNumber:@"564674584567" AndWorkNumber:@"546347845467847"];
        Contact *pesho = [[Contact alloc] initWithName:@"pesho" PhoneNumber:@"4568569678967" HomeNumber:@"48678589606" AndWorkNumber:@"57586960946362"];
        
        self.contacts = [[NSMutableArray alloc] initWithObjects:ivan, kiro, pesho, nil];
    }
    
    return self;
}

@end
