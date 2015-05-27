//
//  FeedsTableViewController.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/26/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManager.h"
#import "FlickrTableViewCell.h"

@interface FeedsTableViewController : UITableViewController<DataManagerDelegate, NSFetchedResultsControllerDelegate>

@end
