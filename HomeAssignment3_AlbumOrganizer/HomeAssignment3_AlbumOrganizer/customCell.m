//
//  customCell.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "customCell.h"

@implementation customCell

@synthesize labelAlbumTitle = _labelAlbumTitle;
@synthesize labelAlbumArtist = _labelAlbumArtist;
@synthesize songsCount = _songsCount;
@synthesize albumCover = _albumCover;

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
