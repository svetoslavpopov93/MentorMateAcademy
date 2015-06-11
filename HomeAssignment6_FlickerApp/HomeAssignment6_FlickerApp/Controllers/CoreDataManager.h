//
//  CoreDataManager.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/27/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>

@import CoreData;

@interface CoreDataManager : NSObject

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;


+ (instancetype)sharedManager;

- (void)insertEntries:(NSArray *)entries;

@end
