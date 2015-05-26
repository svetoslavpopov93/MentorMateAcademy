//
//  Entry.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "Entry.h"

@implementation Entry

-(void)initWithStrings{
    self.title = self.titleString;
    self.link = [NSURL URLWithString:self.linkString];
    self.entryID = self.entryIDString;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZ"];
    self.published = [dateFormatter dateFromString:self.publishedString];
    self.updated = [dateFormatter dateFromString:self.updatedString];
    self.author = self.authorString;
    self.authorURL = self.authorURLString;
    self.iconURL = [NSURL URLWithString:self.iconURLString];
}

@end
