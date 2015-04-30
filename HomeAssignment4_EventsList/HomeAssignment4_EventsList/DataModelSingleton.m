//
//  DataModelSingleton.m
//  HomeAssignment4_EventsList
//
//  Created by svetoslavpopov on 4/23/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import "DataModelSingleton.h"
static DataModelSingleton *sharedDataModel;

@implementation DataModelSingleton

- (id)init
{
    self = [super init];
    
    if (self) {
        self.events = [[NSMutableArray alloc] init];
        self.selectedEvent = [[Event alloc] init];
        self.days = [[NSMutableDictionary alloc] init];
    }
    
    return self;
}

+(id)initSharedDataModel{
    @synchronized(self){
        if (sharedDataModel == nil) {
            sharedDataModel = [[self alloc] init];
        }
        
        return sharedDataModel;
    }
}

#pragma mark Public methods
/// The method adds few example events. To enable him, go to AppDelegate.m and uncomment the method call
-(void)fillExampleEvents{
    
    NSDateFormatter *mmddccyy = [[NSDateFormatter alloc] init];
    mmddccyy.timeStyle = NSDateFormatterNoStyle;
    mmddccyy.dateFormat = @"dd/MM/yyyy";
    NSDate *date = [mmddccyy dateFromString:@"12/11/2015"];
    
    [self addEvent:[[Event alloc] initWithEventLabel:@"Metallica" relatedPerson:@"Svetoslav" hours:2 eventInfo:@"Sdadadkmadla" eventDate:date] forDate:date];
    
    date = [mmddccyy dateFromString:@"14/11/2015"];
    [self addEvent:[[Event alloc] initWithEventLabel:@"Bon Jovi" relatedPerson:@"Svetoslav" hours:2 eventInfo:@"Sdadadkmadla" eventDate:date] forDate:date];
    
    date = [mmddccyy dateFromString:@"16/11/2015"];
    [self addEvent:[[Event alloc] initWithEventLabel:@"Deep Purple" relatedPerson:@"Svetoslav" hours:2 eventInfo:@"Sdadadkmadla" eventDate:date] forDate:date];
    
    date = [mmddccyy dateFromString:@"12/11/2015"];
    [self addEvent:[[Event alloc] initWithEventLabel:@"Rainbow" relatedPerson:@"Svetoslav" hours:2 eventInfo:@"Sdadadkmadla" eventDate:date] forDate:date];
    
    date = [mmddccyy dateFromString:@"15/11/2015"];
    [self addEvent:[[Event alloc] initWithEventLabel:@"Black Sabath" relatedPerson:@"Svetoslav" hours:2 eventInfo:@"Sdadadkmadla" eventDate:date] forDate:date];
    
    date = [mmddccyy dateFromString:@"17/11/2015"];
    [self addEvent:[[Event alloc] initWithEventLabel:@"Megadeath" relatedPerson:@"Svetoslav" hours:2 eventInfo:@"Sdadadkmadla" eventDate:date] forDate:date];
    
    date = [mmddccyy dateFromString:@"11/11/2015"];
    [self addEvent:[[Event alloc] initWithEventLabel:@"Rammstein" relatedPerson:@"Svetoslav" hours:2 eventInfo:@"Sdadadkmadla" eventDate:date] forDate:date];
    
}

-(void)addEvent:(Event*)event forDate: (NSDate*)date{
    
    // Convert string to date object
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"EEE/dd/MMM"];
    
    NSString *dt = [dateFormat stringFromDate:date];
    
    if ([self.days objectForKey:dt] == nil) {
        [self.days setObject:[[NSMutableArray alloc] init] forKey:dt];
    }
    
    NSMutableArray *current = [self.days objectForKey:dt];
    
    [current addObject:event];
    NSLog(@"Event added!");
}

@end

