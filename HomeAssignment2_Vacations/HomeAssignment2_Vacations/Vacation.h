//
//  Vacation.h
//  HomeAssignment2_Vacations
//
//  Created by Student17 on 4/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Vacation;

@protocol BrokerDelegate <NSObject>

@required
-(void)goOnVacation: (Vacation*)vacation;
-(bool)isVacation:(Vacation *)vacation openForDate: (NSString*)day;
-(void)reviewVacation: (Vacation*)vacation;
@end

typedef enum
{
    Monastry = 0,
    Vila = 1,
    Hotel = 2
} Types;

@interface Vacation : NSObject

@property (weak, nonatomic) id<BrokerDelegate> delegate;
@property (nonatomic) int vacationType;
@property NSString *name;
@property NSString *info;
@property NSString *location;
@property NSMutableArray *openDays;
@property float price;
@property int reviewCount;
@property BOOL isBooked;

-(id)init;
-(id)initWithVacationType: (int)vacationType Name: (NSString*)name Info: (NSString*)info Location: (NSString*)location OpenDays: (NSMutableArray*)openDays AndPrice: (float)price;

@end
