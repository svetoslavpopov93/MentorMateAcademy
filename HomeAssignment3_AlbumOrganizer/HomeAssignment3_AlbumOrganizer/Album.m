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
        self.albumCover = [UIImage imageNamed:@"default-cover.jpg"];
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

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    
    if (self) {
        self.albumCover = [aDecoder decodeObjectForKey:@"albumCover"];
        self.albumTitle = [aDecoder decodeObjectForKey:@"albumTitle"];
        self.albumArtist = [aDecoder decodeObjectForKey:@"albumArtist"];
        self.numberOfSongs = [aDecoder decodeIntForKey:@"numberOfSongs"];
        NSMutableArray *songsArray = [aDecoder decodeObjectForKey:@"songs"];
        self.songs = [[NSMutableArray alloc] initWithArray:songsArray copyItems:YES];
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.albumCover forKey:@"albumCover"];
    [aCoder encodeObject:self.albumTitle forKey:@"albumTitle"];
    [aCoder encodeObject:self.albumArtist forKey:@"albumArtist"];
    [aCoder encodeInt:self.numberOfSongs forKey:@"numberOfSongs"];
    [aCoder encodeObject:self.songs forKey:@"songs"];
}

@end
