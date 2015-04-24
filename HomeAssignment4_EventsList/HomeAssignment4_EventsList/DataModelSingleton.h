//
//  DataModelSingleton.h
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Event.h"

@interface DataModelSingleton : NSObject
+(id)initSharedDataModel;
-(void)fillExampleEvents;

@property (nonatomic, strong) NSMutableArray *events;
@property (nonatomic, strong) NSMutableDictionary *days;

@end
