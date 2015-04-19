//
//  customCell.h
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface customCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UIImageView *albumCover;
@property (nonatomic, weak) IBOutlet UILabel *labelAlbumTitle;
@property (nonatomic, weak) IBOutlet UILabel *labelAlbumArtist;
@property (nonatomic, weak) IBOutlet UILabel *songsCount;

@end
