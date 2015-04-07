//
//  DataModelSingleton.h
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/7/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"

@interface DataModelSingleton : NSObject

@property(nonatomic, strong) NSMutableDictionary* users;
+(id)sharedDataModel;
+(BOOL)didPerformUserCheckWithUsername: (NSString *)username andPassword: (NSString *)password;

//-(id)init;

-(void)didFillExampleUsers;
-(void)didRegisterUserWithUserName: (NSString*)username AndPassword: (NSString* )password;

@end
