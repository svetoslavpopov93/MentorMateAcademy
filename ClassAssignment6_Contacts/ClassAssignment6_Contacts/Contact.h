//
//  Contact.h
//  ClassAssignment6_Contacts
//
//  Created by Student17 on 4/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Contact : NSObject

@property(nonatomic, strong)NSString *name;
@property(nonatomic, strong)NSString *number;
@property(nonatomic, strong)NSString *homeNumber;
@property(nonatomic, strong)NSString *workNumber;

-(id)initWithName: (NSString *)name PhoneNumber: (NSString *)phoneNumber HomeNumber: (NSString *)homeNumber AndWorkNumber: (NSString*)workNumber;

@end
