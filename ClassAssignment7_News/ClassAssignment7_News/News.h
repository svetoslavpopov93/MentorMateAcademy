//
//  News.h
//  ClassAssignment7_News
//
//  Created by Student17 on 4/15/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface News : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *content;
@property (nonatomic)BOOL isFeatured;

-(id)initWithTitle: (NSString *)title Content: (NSString *)content andIsFeatured: (BOOL)isFeatured;

@end
