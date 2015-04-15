//
//  News.m
//  ClassAssignment7_News
//
//  Created by Student17 on 4/15/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "News.h"

@implementation News

- (id)init
{
    self = [super init];
    
    if (self) {
        self.title = [[NSString alloc] init];
        self.content = [[NSString alloc] init];
    }
    
    return self;
}

-(id)initWithTitle: (NSString *)title Content: (NSString *)content andIsFeatured: (BOOL)isFeatured{
    self = [self init];
    
    if (self) {
        self.title = title;
        self.content = content;
        self.isFeatured = isFeatured;
    }
    
    return self;
}

@end
