//
//  Event.h
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Event : NSObject <NSCoding>

@property (nonatomic, strong) NSString *eventLabel;
@property (nonatomic, strong) UIImage *eventCover;
@property (nonatomic, strong) NSString *relatedPerson;
@property (nonatomic) float hours;
@property (nonatomic, strong) NSString *eventInfo;
@property (nonatomic, strong)NSDate *eventDate;
-(id)initWithEventLabel: (NSString* )eventLabel relatedPerson: (NSString*)relatedPerson hours: (float)hours eventInfo: (NSString *)eventInfo eventDate: (NSDate *)eventDate;

@end
