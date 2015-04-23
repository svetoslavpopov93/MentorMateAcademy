//
//  DataModelSingleton.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "DataModelSingleton.h"
static DataModelSingleton *sharedDataModel;

@implementation DataModelSingleton

- (id)init
{
    self = [super init];
    
    if (self) {
        self.events = [[NSMutableArray alloc] init];
    }
    
    return self;
}

+(id)initSharedDataModel{
    @synchronized(self){
        if (sharedDataModel == nil) {
            sharedDataModel = [[self alloc] init];
        }
        
        return sharedDataModel;
    }
}
@end
