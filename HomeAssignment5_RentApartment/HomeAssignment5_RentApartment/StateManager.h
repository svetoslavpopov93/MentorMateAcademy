//
//  StateManager.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/15/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#include <stdlib.h>
#import "AppDelegate.h"
#import "Apartment.h"
#import "SearchPopoverViewController.h"

@protocol FetchedResultsDataDelegate

@required
-(void)dataDidChanged;

@end

@interface StateManager : NSObject <NSFetchedResultsControllerDelegate>

@property(nonatomic, strong) User *currentUser; // Represents the logged user
@property(nonatomic, strong) Apartment *currentApartment; // Represents the selected apartment
@property (nonatomic, strong) NSFetchedResultsController* fetchedResultsController;
@property (nonatomic) NSString *predicateText;

@property (nonatomic, assign) id  delegate;

+(id)sharedStateManager;
-(void)activateRandomFunctionalityGenerator;
-(void)dataDidChange;
-(void)fetchObjectsWithPredicate:(NSString*)str;

@end
