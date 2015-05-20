//
//  StateManager.m
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/15/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "StateManager.h"
static StateManager *sharedManager;

@implementation StateManager
@synthesize currentUser;

+(id)sharedStateManager{
    
    @synchronized(self){
        if (sharedManager == nil) {
            sharedManager = [[self alloc] init];
        }
        
        return sharedManager;
    }
}

#pragma mark Multi threading

-(void)activateRandomFunctionalityGenerator{
    [NSTimer scheduledTimerWithTimeInterval:10.0
                                     target:self
                                   selector:@selector(startMultiThreadedAction)
                                   userInfo:nil
                                    repeats:YES];
    
}

-(void)startMultiThreadedAction{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self generateRandomAction]; // 1
        dispatch_async(dispatch_get_main_queue(), ^{
            [self timerDidFinishCounting]; // 2
        });
    });
}

-(void)generateRandomAction{
    int number = 0 + rand() % (4 - 0);
    
    switch (number) {
        case 1:
            [self addRandomApartment];
            break;
        case 2:
            [self addRandomApartment];
            break;
        case 3:
            [self deleteRandomApartment];
        default:
            [self editRandomApartment];
            break;
    }
    
}

-(void)timerDidFinishCounting{
    NSLog(@"Timer did finish counting!");
}

// Adds new apartment with random generated values (without image)
-(void)addRandomApartment{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    
    // Configuring the saving request from the input values
    NSManagedObjectContext *context = appDelegate.managedObjectContext;
    Apartment *newApartment = [NSEntityDescription insertNewObjectForEntityForName:@"Apartment" inManagedObjectContext:context];
    [newApartment setValue:[NSString stringWithFormat:@"%d", 1 + rand() % (222222222-1)]
                    forKey:@"apartmentType"];
    [newApartment setValue:[NSString stringWithFormat:@"%d", 1 + rand() % (222222222-1)]
                    forKey:@"city"];
    [newApartment setValue:[NSString stringWithFormat:@"%d", 1 + rand() % (222222222-1)]
                    forKey:@"cityQuarter"];
    [newApartment setValue:[NSString stringWithFormat:@"%d", 1 + rand() % (222222222-1)]
                    forKey:@"details"];
    [newApartment setValue:nil
                    forKey:@"image"];
    [newApartment setValue:@(1 + rand() % (2222222-1))
                    forKey:@"price"];
    [newApartment setValue:[[StateManager sharedStateManager] currentUser]
                    forKey:@"owner"];
    [newApartment setValue:[NSString stringWithFormat:@"%d", 1 + rand() % (222222222-1)]
                    forKey:@"title"];
    
    // After the context saving the returned data is checked and if the saving fails an alert is shown.
    // If the saving is successfull, the application is returned to the login screen
    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Failed to add random apartment!");
    }
    else{
        NSLog(@"Random apartment added!");
    }
}

// Picks one random apartment and edits its values
-(void)editRandomApartment{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Apartment" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    NSError *error = [[NSError alloc] init];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    
    if(fetchedObjects.count > 0){
        int number = 0 + rand() % fetchedObjects.count;
        [[fetchedObjects objectAtIndex:number] setTitle:[NSString stringWithFormat:@"%d edited!", 1 + rand() % (222222222-1)]];
        [[fetchedObjects objectAtIndex:number] setCity:[NSString stringWithFormat:@"%d edited!", 1 + rand() % (222222222-1)]];
        [[fetchedObjects objectAtIndex:number] setCityQuarter:[NSString stringWithFormat:@"%d edited!", 1 + rand() % (222222222-1)]];
        [[fetchedObjects objectAtIndex:number] setDetails:[NSString stringWithFormat:@"%d edited!", 1 + rand() % (222222222-1)]];
    }
}

// Picks random apartment and deletes him from the database
-(void)deleteRandomApartment{
    AppDelegate *appDelegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Apartment" inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    NSError *error = [[NSError alloc] init];
    NSArray *fetchedObjects = [context executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects.count > 0) {
        int number = 0 + rand() % fetchedObjects.count;
        
        [context deleteObject:fetchedObjects[number]];
        
        if (![context save:&error]) {
            NSLog(@"Failed to delete random apartment!");
        }
        else{
            NSLog(@"Random apartment deleted!");
        }
    }
    else{
        NSLog(@"No elements for deletion!");
    }
}

@end
