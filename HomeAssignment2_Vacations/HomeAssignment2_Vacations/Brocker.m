//
//  Brocker.m
//  HomeAssignment2_Vacations
//
//  Created by Student17 on 4/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "Brocker.h"
#import "DataModelSingleton.h"

@implementation Brocker{
    DataModelSingleton
}
-(void)goOnVacation:(Vacation *)vacation{
    NSLog(@"%@", vacation.name);
}

-(void)reviewVacation:(Vacation *)vacation{
    
}

-(bool)isVacation:(Vacation *)vacation openForDate: (NSString*)day{
    
    return true;
}
@end
