//
//  FlickrTableViewCell.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/26/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellEntry.h"
#import "DataManager.h"

@protocol FlickrTableViewCellDelegate <NSObject>
@optional
- (void)userDidClickOnImageWithURL:(NSURL *)url;

@end
@interface FlickrTableViewCell : UITableViewCell

@property (nonatomic, strong) CellEntry *cellEntry;
@property(nonatomic, weak) id <FlickrTableViewCellDelegate> delegate;

@end
