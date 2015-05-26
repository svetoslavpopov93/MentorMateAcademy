//
//  Entry.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Author.h"

@interface Entry : NSObject

@property(nonatomic)NSString*titleString;
@property(nonatomic)NSString*linkString;
@property(nonatomic)NSString*entryIDString;
@property(nonatomic)NSString*publishedString;
@property(nonatomic)NSString*updatedString;
@property(nonatomic)NSString *authorString;
@property(nonatomic)NSString*authorURLString;
@property(nonatomic)NSString*iconURLString;

@property(nonatomic)NSString*title;
@property(nonatomic)NSURL*link;
@property(nonatomic)NSString*entryID;
@property(nonatomic)NSDate*published;
@property(nonatomic)NSDate*updated;
@property(nonatomic)NSString*author;
@property(nonatomic)NSString*authorURL;
@property(nonatomic)NSURL*iconURL;

-(void)initWithStrings;

@end
