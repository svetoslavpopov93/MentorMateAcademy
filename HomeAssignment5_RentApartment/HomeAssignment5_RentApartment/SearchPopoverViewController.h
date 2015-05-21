//
//  SearchPopoverViewController.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/21/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StateManager.h"

@protocol SearchControllerDelegate

@required

-(void)searchButtonClicked;

@end

@interface SearchPopoverViewController : UIViewController

@property (nonatomic, strong) NSString* predicateString;
@property (nonatomic, assign) id  delegate;

@end
