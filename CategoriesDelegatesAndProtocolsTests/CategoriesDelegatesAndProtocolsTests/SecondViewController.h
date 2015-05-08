//
//  SecondViewController.h
//  CategoriesDelegatesAndProtocolsTests
//
//  Created by svetoslavpopov on 5/4/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ConnectionManager.h"

@interface SecondViewController : UIViewController <ConnectionManagerDelegate>

@property (nonatomic, strong) NSString *message;

@end
