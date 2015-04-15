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
        self.backgroundEntersCounter = 0;
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

-(void)addVacation:(Vacation *)vacation{
    if (vacation.vacationType == 0) {
        [self.monastryVacations addObject:vacation];
        latestMonastryIndex++;
    }
    else if(vacation.vacationType == 1){
        [self.vilaVacations addObject:vacation];
        latestVilaIndex++;
    }
    else{
        [self.hotelVacations addObject:vacation];
        latestHotelIndex++;
    }
}

-(void)removeVacation:(Vacation *)vacation{
    if (vacation.vacationType == 0) {
        [self.monastryVacations removeLastObject];
        latestMonastryIndex--;
    }
    
    else if(vacation.vacationType == 1){
        [self.vilaVacations removeLastObject];
        latestVilaIndex--;
    }
    
    else{
        [self.hotelVacations removeLastObject];
        latestMonastryIndex--;
    }
}

-(void)bookVacation: (Vacation *)vacation{
    vacation.isBooked = true;
    
    if(vacation.vacationType == 0){
        vacation.isBooked = YES;
        [self.monastryVacations removeLastObject];
    }
    
    else if (vacation.vacationType == 1){
        vacation.isBooked = YES;
        [self.vilaVacations removeLastObject];
    }
    
    else{
        vacation.isBooked = YES;
        [self.hotelVacations removeLastObject];
    }
    
    [self.bookedVacations addObject:vacation];
}

-(void)unbookVacation: (Vacation *)vacation{
    vacation.isBooked = NO;
    
    if(vacation.vacationType == 0){
        [self.monastryVacations addObject: [self.bookedVacations lastObject]];
        [self.bookedVacations removeLastObject];
    }
    else if(vacation.vacationType == 1){
        [self.vilaVacations addObject: [self.bookedVacations lastObject]];
        [self.bookedVacations removeLastObject];
    }
    else {
        [self.hotelVacations addObject: [self.bookedVacations lastObject]];
        [self.bookedVacations removeLastObject];
    }
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

-(void)increasePrices: (int)index{
    Vacation *newVacation = [[Vacation alloc] init];
    
    for (int ind = 0; ind < index; ind++) {
        for (int i = 0; i < (int)self.monastryVacations.count; i++) {
            newVacation = self.monastryVacations[i];
        
            newVacation.price = (newVacation.price * 20) / 100 + newVacation.price;
        
            newVacation.price = [NSString stringWithFormat:@"%0.2f", newVacation.price].floatValue;
            self.monastryVacations[i] = newVacation;
        }
        
        
        for (int i = 0; i < (int)self.vilaVacations.count; i++) {
            newVacation = self.vilaVacations[i];
        
            newVacation.price = (newVacation.price * 20) / 100 + newVacation.price;
        
            newVacation.price = [NSString stringWithFormat:@"%0.2f", newVacation.price].    floatValue;
            self.vilaVacations[i] = newVacation;
        }
        
        for (int i = 0; i < (int)self.hotelVacations.count; i++) {
            newVacation = self.hotelVacations[i];
        
            newVacation.price = (newVacation.price * 20) / 100 + newVacation.price;
        
            newVacation.price = [NSString stringWithFormat:@"%0.2f", newVacation.price].floatValue;
            self.hotelVacations[i] = newVacation;
        }
    }
}

@end
