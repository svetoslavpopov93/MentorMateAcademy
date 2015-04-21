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

-(id)initWithArtistName: (NSString*)artist AndSongTitle: (NSString*)title{
    self = [self init];
    
    if(self){
        self.artistName = artist;
        self.songTitle = title;
    }
    
    return self;
}

-(id)initWithArtistName: (NSString*)artist SongTitle: (NSString*)title AndLength:(float)length{
    self = [self init];
    
    if(self){
        self.artistName = artist;
        self.songTitle = title;
        self.length = length;
    }
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.artistName forKey:@"artistName"];
    [aCoder encodeObject:self.songTitle forKey:@"songTitle"];
    [aCoder encodeFloat:self.length forKey:@"length"];
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [self init];
    
    if (self) {
        self.artistName = [aDecoder decodeObjectForKey:@"artistName"];
        self.songTitle = [aDecoder decodeObjectForKey:@"songTitle"];
        self.length = [aDecoder decodeFloatForKey:@"length"];
    }
    
    return self;
}

-(id)copyWithZone:(NSZone *)zone{
    Song *copy = [[Song allocWithZone:zone] init];
    
    if (copy) {
        copy.artistName = self.artistName;
        copy.songTitle = self.songTitle;
        copy.length = self.length;
    }
    
    return copy;
}
@end
