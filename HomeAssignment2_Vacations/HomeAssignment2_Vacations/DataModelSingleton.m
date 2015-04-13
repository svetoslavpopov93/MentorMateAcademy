//
//  DataModelSingleton.m
//  HomeAssignment2_Vacations
//
//  Created by Student17 on 4/13/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DataModelSingleton.h"
#include <stdlib.h>

//static DataModelSingleton *sharedModel;
static DataModelSingleton *sharedDataModel;

@implementation DataModelSingleton{
    int latestMonastryIndex;
    int latestVilaIndex;
    int latestHotelIndex;
    int vacationIndex;
}

+(id)sharedDataModel{
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
        self.vacations = [[NSMutableArray alloc]init];
        self.monastryVacations = [[NSMutableArray alloc] init];
        self.vilaVacations = [[NSMutableArray alloc] init];
        self.hotelVacations = [[NSMutableArray alloc] init];
        self.bookedVacations = [[NSMutableArray alloc] init];
        self.selectedVacation = [[Vacation alloc] init];
        latestMonastryIndex = 0;
        latestVilaIndex = 0;
        latestHotelIndex = 0;
        vacationIndex = 0;
    }
    
    return self;
}

-(void)addVacations:(NSMutableSet *)vacations{
//    for (Vacation* vacation in vacations) {
//        
//        if (vacation.vacationType == 0) {
//            latestMonastryIndex++;
//        }
//        else if(vacation.vacationType == 1){
//            latestVilaIndex++;
//        }
//        else{
//            latestHotelIndex++;
//        }
//        
//        vacationIndex++;
//        [self.vacations addObject:vacation];
//    }
}

-(void)removeVacations:(NSMutableSet *)vacations{
    for (Vacation* vacation in vacations) {
        [self.vacations removeObjectAtIndex:[self.vacations indexOfObject:vacation]];
    }
}

-(void)bookVacation: (Vacation *)vacation{
    vacation.isBooked = true;
    [self.bookedVacations addObject:vacation];
}

-(void)unbookVacation: (Vacation *)vacation{
    vacation.isBooked = false;
    [self.bookedVacations removeObject:vacation];
}

-(void)generateVacation{
    Vacation *newVacation;
    int r = rand() % 3;
    
    switch (r) {
        case 0:
            newVacation = [self generateRandomMonastryVacation];
            [self.monastryVacations addObject:newVacation];
            [self.vacations addObject:newVacation];
            vacationIndex++;
            
            NSLog(@"Monastry vacation added! Index: %d", latestMonastryIndex);
            break;
        case 1:
            newVacation = [self generateRandomVilaVacation];
            [self.vilaVacations addObject:newVacation];
            [self.vacations addObject:newVacation];
            vacationIndex++;
            
            NSLog(@"Vila vacation added! Index: %d", latestVilaIndex);
            break;
        case 2:
            newVacation = [self generateRandomHotelVacation];
            [self.hotelVacations addObject:newVacation];
            [self.vacations addObject:newVacation];
            vacationIndex++;
            
            NSLog(@"Hotel vacation added! Index: %d", latestHotelIndex);
            break;
        default:
            break;
    }
    
}

-(Vacation*)generateRandomMonastryVacation{
    
    Vacation *monastryVacation = [[Vacation alloc]
                                  initWithVacationType:Monastry
                                  Name:[NSString stringWithFormat:@"Monastry%d", latestMonastryIndex]
                                  Info:@"rughaprigpagap a jgiajer gpjarpgiu aiurg jijgr ipajrpg japrjig aiujgpi ajrgja prgiaj pirgjapij rgpiajrepg japrgj pajg paierj gipajergi jaeiprgj aiegjr ipuajergipu jaerigj piaegjrp"
                                  Location:@"Sofia"
                                  OpenDays:[[NSMutableArray alloc]
                                            initWithObjects:@"Monday",@"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", @"Sunday", nil]
                                  AndPrice:150];
    
    latestMonastryIndex++;
    vacationIndex++;
    
    return monastryVacation;
}

-(Vacation*)generateRandomVilaVacation{
    
    Vacation *vilaVacation = [[Vacation alloc]
                              initWithVacationType:Vila
                                  Name:[NSString stringWithFormat:@"Vila%d", latestVilaIndex]
                                  Info:@"hhdhdtyjdhpij pgsj piosdg iosdfgj oisdjg oisjdigo jspdoijg psoidjgopi jsdgoi jsdoigj oisdjg iosdjgo ijsdog jsdopgji "
                                  Location:@"Varna"
                                  OpenDays:[[NSMutableArray alloc]
                                            initWithObjects:@"Monday",@"Tuesday", @"Wednesday", @"Thursday", @"Friday", @"Saturday", nil]
                                  AndPrice:160];
    
    latestVilaIndex++;
    vacationIndex++;
    
    return vilaVacation;
}

-(Vacation*)generateRandomHotelVacation{
    
    Vacation *hotelVacation = [[Vacation alloc]
                                  initWithVacationType:Hotel
                                  Name:[NSString stringWithFormat:@"Hotel%d", latestHotelIndex]
                                  Info:@"iuohfnil aiul al iar iluruli nsnur lsuin nuisl ns nului siur nlsiun lsnruisglnnr uisrnglusnrgnslui"
                                  Location:@"Burgas"
                                  OpenDays:[[NSMutableArray alloc]
                                            initWithObjects:@"Monday",@"Tuesday", @"Wednesday", @"Thursday", @"Friday", nil]
                                  AndPrice:200];
    
    latestHotelIndex++;
    vacationIndex++;
    
    return hotelVacation;
}

@end
