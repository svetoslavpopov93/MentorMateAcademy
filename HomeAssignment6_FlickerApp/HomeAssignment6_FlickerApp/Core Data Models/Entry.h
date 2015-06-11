//
//  Entry.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/26/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Entry : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * entryID;
@property (nonatomic, retain) NSDate * publishedDate;
@property (nonatomic, retain) NSDate * updatedDate;
@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * authorURL;
@property (nonatomic, retain) NSData * authorIconURL;
@property (nonatomic, retain) NSData * mainImageURL;

@end
