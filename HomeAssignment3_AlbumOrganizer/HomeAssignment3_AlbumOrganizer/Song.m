//
//  Song.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "Song.h"

@implementation Song

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.artistName = [[NSString alloc] init];
        self.songTitle = [[NSString alloc] init];
        self.length = 0;
    }
    
    return self;
}

@end
