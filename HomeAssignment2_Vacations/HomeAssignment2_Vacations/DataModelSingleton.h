//
//  DataModelSingleton.h
//  HomeAssignment2_Vacations
//
//  Created by Student17 on 4/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Vacation.h"

@interface DataModelSingleton : NSObject

@property NSMutableArray *vacations;
@property NSMutableArray *monastryVacations;
@property NSMutableArray *vilaVacations;
@property NSMutableArray *hotelVacations;
@property NSMutableArray *bookedVacations;

@property Vacation *selectedVacation;

+(id)sharedDataModel;
-(id)init;

-(void)addVacation:(Vacation *)vacation;
-(void)removeVacation:(Vacation *)vacation;
-(void)bookVacation: (Vacation *)vacation;
-(void)unbookVacation: (Vacation *)vacation;
-(void)generateVacation;

@end
