//
//  EventHeaderReusableView.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/29/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "EventHeaderReusableView.h"

@implementation EventHeaderReusableView
- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.labelSectionHeaderTitle.text = self.headerText;
    }
    
    return self;
}
@end
