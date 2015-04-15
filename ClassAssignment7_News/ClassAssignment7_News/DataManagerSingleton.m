//
//  DataManagerSingleton.m
//  ClassAssignment7_News
//
//  Created by Student17 on 4/15/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "DataManagerSingleton.h"
static DataManagerSingleton *sharedDataManager;

@implementation DataManagerSingleton

+(id)initSharedDataManager{
    
    @synchronized(self){
        if(sharedDataManager == nil){
            sharedDataManager = [[self alloc] init];
        }
        
        return sharedDataManager;
    }
}

-(id)init{
    self = [super init];
    
    if (self) {
        self.news = [[NSMutableArray alloc] init];
    }
    
    return self;
}

-(void)generateRandomNews{
    for (int i = 0; i < 25; i++) {
        if (i % 2 == 0) {
            News *newTopic = [[News alloc] initWithTitle:[NSString stringWithFormat:@"Title%d", i + 1] Content:[NSString stringWithFormat:@"Content Content Content Content %d", i + 1] andIsFeatured:true];
            [self.news addObject:newTopic];
        }
        else{
            News *newTopic = [[News alloc] initWithTitle:[NSString stringWithFormat:@"Title%d", i + 1] Content:[NSString stringWithFormat:@"Content Content Content Content %d", i + 1] andIsFeatured:false];
            [self.news addObject:newTopic];
        }
    }
}

+(News*)generateSingleNews{
    News *newNews = [[News alloc] initWithTitle:@"SingleGeneratedNews" Content:@"sinsodifnsldfkmlsfm" andIsFeatured:false];
    
    return newNews;
}
@end
