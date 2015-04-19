//
//  Album.h
//  HomeAssignment3_AlbumOrganizer
//
//  Created by Student17 on 4/19/15.
//  Copyright (c) 2015 MentorMate. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface Album : NSObject

@property (nonatomic, strong) UIImage* albumCover;
@property (nonatomic, strong) NSString* albumTitle;
@property (nonatomic, strong) NSString* albumArtist;
@property (nonatomic) int numberOfSongs;
@property (nonatomic, strong) NSMutableDictionary* songs;

-(id)initWithTitle: (NSString*)title Artist: (NSString*)artist;

@end
