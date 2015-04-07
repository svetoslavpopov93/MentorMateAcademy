//
//  User.h
//  ClassAssignment5_Cinemas
//
//  Created by svetoslavpopov on 4/7/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, strong) NSString *username;
@property (nonatomic, strong) NSString *password;

-(id)init;

@end
