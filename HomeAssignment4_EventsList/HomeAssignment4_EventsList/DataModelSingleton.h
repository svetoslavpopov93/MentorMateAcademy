//
//  DataModelSingleton.h
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModelSingleton : NSObject
+(id)initSharedDataModel;

@property (nonatomic, strong) NSMutableArray *events;

@end
