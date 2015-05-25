//
//  RSSParser.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"
#import "Author.h"
#import "AppDelegate.h"

@interface RSSParser : NSObject <NSXMLParserDelegate>

@property(nonatomic, strong) Entry* entry;
@property(nonatomic, strong) AppDelegate *appdelegate;
@property(nonatomic, strong) NSMutableArray *entries;
@property(nonatomic, strong) NSMutableArray *authors;

-(RSSParser*)initXMLParser;

@end
