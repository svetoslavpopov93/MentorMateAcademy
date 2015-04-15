//
//  DataManagerSingleton.h
//  ClassAssignment7_News
//
//  Created by Student17 on 4/15/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "News.h"

@interface DataManagerSingleton : NSObject

@property (nonatomic, strong) NSMutableArray *news;

+(id)initSharedDataManager;
-(void)generateRandomNews;
+(News*)generateSingleNews;

@end
