//
//  ViewController.h
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NSString+Utilities.h"
#import "CustomerService.h"
#import "ConnectionManager.h"
#import "SecondViewController.h"

@protocol PerformActionDelegate <NSObject>
@required
-(void)userDidClickOnButton: (NSString *)message;
@end

@interface ViewController : UIViewController <CustomerServiceDelegate>

@property (nonatomic, retain)id<PerformActionDelegate> delegate;
@end

