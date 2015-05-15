//
//  User.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/14/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Apartment, Comment;

@interface User : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSString * nickName;
@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSNumber * age;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSSet *apartments;
@property (nonatomic, retain) NSSet *comments;
@end

@interface User (CoreDataGeneratedAccessors)

- (void)addApartmentsObject:(Apartment *)value;
- (void)removeApartmentsObject:(Apartment *)value;
- (void)addApartments:(NSSet *)values;
- (void)removeApartments:(NSSet *)values;

- (void)addCommentsObject:(Comment *)value;
- (void)removeCommentsObject:(Comment *)value;
- (void)addComments:(NSSet *)values;
- (void)removeComments:(NSSet *)values;

@end
