//
//  StateManager.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/15/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface StateManager : NSObject

@property(nonatomic, strong) User *currentUser; // Represents the logged user
@property(nonatomic, strong) Apartment *currentApartment; // Represents the selected apartment

+(id)sharedStateManager;

@end
