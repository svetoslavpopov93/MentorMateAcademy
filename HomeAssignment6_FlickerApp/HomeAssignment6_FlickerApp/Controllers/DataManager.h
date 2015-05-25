//
//  DataManager.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataManager : NSObject

@property(nonatomic, strong)NSMutableArray *entries;

+sharedDataManager;

@end
