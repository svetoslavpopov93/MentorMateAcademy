//
//  DataManager.h
//  HomeAssignment6_FlickerApp
//
//  Created by Student17 on 5/25/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Entry.h"
#import "AppDelegate.h"

@protocol DataManagerDelegate <NSObject>
@optional
- (void)dataDidFinishFetching;
- (void)userDidTapOnImageWithURL:(NSURL*)url;
@end
@interface DataManager : NSObject <NSXMLParserDelegate>

@property(nonatomic, strong) NSArray *entries;
@property(nonatomic, weak) id <DataManagerDelegate> delegate;

-(void)fetchFlickrFeed;
-(void)imageClicked: (NSURL*)url;
+sharedDataManager;
+sharedOperationQueue;

@end
