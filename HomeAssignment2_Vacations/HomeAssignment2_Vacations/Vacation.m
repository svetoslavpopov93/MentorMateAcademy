//
//  Vacation.m
//  HomeAssignment2_Vacations
//
//  Created by Student17 on 4/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "Vacation.h"
@implementation Vacation

-(id)init{
    self = [super init];
    
    if(self){
        self.name = [[NSString alloc] init];
        self.info = [[NSString alloc] init];
        self.location = [[NSString alloc] init];
        self.openDays = [[NSMutableArray alloc] init];
        self.price = 0;
        self.reviewCount = 0;
    }
    
    return self;
}

-(id)initWithVacationType: (enum type)vacationType Name: (NSString*)name Info: (NSString*)info Location: (NSString*)location OpenDays: (NSMutableArray*)openDays AndPrice: (float)price{
    
    self = [self init];
    
    if(self){
        self.vacationType = &(vacationType);
        self.name = name;
        self.info = info;
        self.location = location;
        self.openDays = openDays;
        self.price = price;
    }
    
    return self;
}

@end
