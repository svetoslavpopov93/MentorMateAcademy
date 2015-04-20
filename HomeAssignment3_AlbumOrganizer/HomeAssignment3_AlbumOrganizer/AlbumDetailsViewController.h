//
//  AlbumDetailsViewController.h
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DataManagerSingleton.h"

@interface AlbumDetailsViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate>{
    NSMutableArray *songs;
}

@property(nonatomic, retain) NSMutableArray *songs;
@end
