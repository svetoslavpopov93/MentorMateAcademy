//
//  Song.h
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Song : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString* artistName;
@property (nonatomic, strong) NSString* songTitle;
@property (nonatomic) float length;

-(id)initWithArtistName: (NSString*)artist SongTitle: (NSString*)title AndLength:(float)length;
-(id)initWithArtistName: (NSString*)artist AndSongTitle: (NSString*)title;

@end
