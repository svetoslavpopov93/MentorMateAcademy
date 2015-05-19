//
//  CommentsViewController.h
//  HomeAssignment5_RentApartment
//
//  Created by svetoslavpopov on 5/19/15.
//  Copyright (c) 2015 svetoslavpopov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Comment.h"
#import "User.h"
#import "AppDelegate.h"
#import "StateManager.h"
#import "Apartment.h"

@interface CommentsViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate>



@end
