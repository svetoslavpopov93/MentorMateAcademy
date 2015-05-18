//
//  Apartment.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/18/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Comment, User;

@interface Apartment : NSManagedObject

@property (nonatomic, retain) NSData * image;
@property (nonatomic, retain) NSString * apartmentType;
@property (nonatomic, retain) NSString * city;
@property (nonatomic, retain) NSString * cityQuarter;
@property (nonatomic, retain) NSDecimalNumber * price;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * details;
@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) User *owner;
@property (nonatomic, retain) NSSet *comments;
@end

@interface Apartment (CoreDataGeneratedAccessors)

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
