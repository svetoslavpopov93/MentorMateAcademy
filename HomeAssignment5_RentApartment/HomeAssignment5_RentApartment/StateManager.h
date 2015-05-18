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

@property(nonatomic, strong) User *currentUser;

+(id)sharedStateManager;

@end
