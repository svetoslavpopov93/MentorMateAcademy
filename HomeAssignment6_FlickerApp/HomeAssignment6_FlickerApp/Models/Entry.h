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

@property(nonatomic)NSString*title;
@property(nonatomic)NSString*link;
@property(nonatomic)NSString*entryID;
@property(nonatomic)NSString*published;
@property(nonatomic)NSString*updated;
@property(nonatomic)NSString *author;
@property(nonatomic)NSString*authorURL;
@property(nonatomic)NSData*icon;

@end
