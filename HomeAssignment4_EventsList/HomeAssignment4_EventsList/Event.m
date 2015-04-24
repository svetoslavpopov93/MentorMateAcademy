//
//  Event.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "Event.h"

@implementation Event

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        self.eventLabel = [[NSString alloc] init];
        self.eventCover = [[UIImage alloc] init];
        self.relatedPerson = [[NSString alloc] init];
        self.hours = 0;
        self.eventInfo = [[NSString alloc] init];
        self.eventDate = [[NSDate alloc] init];
    }
    
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    
    if(self){
        _eventLabel = [aDecoder decodeObjectForKey:@"eventLabel"];
        _eventCover = [UIImage imageWithData:[aDecoder decodeObjectForKey:@"eventCover"]];
        _relatedPerson = [aDecoder decodeObjectForKey:@"relatedPerson"];
        _hours = [aDecoder decodeFloatForKey:@"hours"];
        _eventInfo = [aDecoder decodeObjectForKey:@"eventInfo"];
        _eventDate = [aDecoder decodeObjectForKey:@"eventDate"];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.eventLabel forKey:@"eventLabel"];
    NSData *eventCoverDataRepresentation = UIImagePNGRepresentation(self.eventCover);
    [aCoder encodeObject:eventCoverDataRepresentation forKey:@"eventCover"];
    [aCoder encodeObject:self.relatedPerson forKey:@"relatedPerson"];
    [aCoder encodeFloat:self.hours forKey:@"hours"];
    [aCoder encodeObject:self.eventInfo forKey:@"eventInfo"];
    [aCoder encodeObject:self.eventDate forKey:@"eventDate"];
}

-(id)copyWithZone:(NSZone *)zone{
    Event *copy = [[Event allocWithZone:zone] init];
    
    if (copy) {
        copy.eventLabel = self.eventLabel;
        copy.eventCover = self.eventCover;
        copy.relatedPerson = self.relatedPerson;
        copy.hours = self.hours;
        copy.eventInfo = self.eventInfo;
        copy.eventDate = self.eventDate;
    }
    
    return copy;
}

-(id)initWithEventLabel: (NSString* )eventLabel relatedPerson: (NSString*)relatedPerson hours: (float)hours eventInfo: (NSString *)eventInfo eventDate: (NSDate *)eventDate{
    self = [self init];
    
    if(self){
        self.eventLabel = eventLabel;
        self.relatedPerson = relatedPerson;
        self.hours = hours;
        self.eventInfo = eventInfo;
        self.eventDate = eventDate;
    }
    
    return self;
}

@end
