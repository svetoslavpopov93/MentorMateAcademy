//
//  DataManager.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DataManager.h"
static DataManager *sharedDataManager;

@implementation DataManager

+ (id)sharedDataManager {
    
    @synchronized(self) {
        if (sharedDataManager == nil)
            sharedDataManager = [[self alloc] init];
    }
    return sharedDataManager;
}

-(instancetype)init{
    self = [super init];
    
    if (self) {
        self.entries = [[NSMutableArray alloc] init];
    }
    
    return self;
}
@end
