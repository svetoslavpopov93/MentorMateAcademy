//
//  Album.m
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import "Album.h"

@implementation Album

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.albumCover = [[UIImage alloc] init];
        self.albumTitle = [[NSString alloc] init];
        self.albumArtist = [[NSString alloc] init];
        self.numberOfSongs = 0;
        self.songs = [[NSMutableArray alloc] init];
    }
    return self;
}

-(id)initWithTitle: (NSString*)title Artist: (NSString*)artist{
    
    self = [self init];
    
    if (self) {
        self.albumTitle = title;
        self.albumArtist = artist;
    }
    
    return self;
}

-(void)addNewSong: (Song*)song{
    [self.songs addObject:song];
}

@end
