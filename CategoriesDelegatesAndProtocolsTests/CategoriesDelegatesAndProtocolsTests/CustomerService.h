//
//  CustomerService.h
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CustomerServiceDelegate <NSObject>

@required
-(void)didSaveCustomer: (NSString *)name;

@end

@interface CustomerService : NSObject

@property (nonatomic, retain) id<CustomerServiceDelegate> delegate;		

-(void)saveCustomer:(NSString*)name;

@end
