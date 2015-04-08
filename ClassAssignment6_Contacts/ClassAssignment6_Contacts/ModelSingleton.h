//
//  ModelSingleton.h
//  ClassAssignment6_Contacts
//
//  Created by Student17 on 4/8/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"

@interface ModelSingleton : NSObject

+(id)dataModel;
@property(nonatomic, strong)NSMutableArray *contacts;
@property(nonatomic)NSInteger index;

@end
