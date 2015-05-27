//
//  CellEntry.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/27/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CellEntry : NSObject

@property (nonatomic, retain) NSString * author;
@property (nonatomic, retain) NSString * authorIcon;
@property (nonatomic, retain) NSString * authorURL;
@property (nonatomic, retain) NSString * entryID;
@property (nonatomic, retain) NSString * link;
@property (nonatomic, retain) NSString * mainImage;
@property (nonatomic, retain) NSDate * publishedDate;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSDate * updatedDate;

@end
