//
//  RSSParser.m
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "RSSParser.h"

@implementation RSSParser

-(RSSParser *)initXMLParser{
    self = [super init];
    
    if(self){
        self.appdelegate = [[UIApplication sharedApplication] delegate];
    }
    
    return self;
}

@end
